pragma solidity ^0.4.18;


contract CarManager  {

  enum CarStatus { RAISING,//募集
                    FREE, //闲置
                    BID_USE,//竞价使用
                    USING, //正在使用
                    SOLD_OUT //售出
                  }

  enum TransactionType {
    BUY,
    RENT,
    SOLD_OUT,
    INCOME
  }

  struct User{
    address add;
    bytes32 name;
    uint256 property;
    Car[] havingCars;
    Car[] usingCars;
    Transaction[] transactions;
  }

  struct Location{
    bytes32 name;
  }

  struct Stock{
    User user;
    uint256 amount;
  }

  struct Car{
    uint carId;
    bytes32 name;
    bytes32 location;
    uint256 amount;
    uint256 price;//eth
    bytes32 desc;
    uint256 rentAmount;//每小时价格
    CarStatus carStatus;
    bytes32 img;
    Stock[] stocks;
    RentInfo[] rentInfos;
    User owner;
  }

  struct RentInfo{
    uint256 startTime;
    uint256 endTime;
    uint256 amount;
    User user;
  }


  struct Transaction{
    User user;
    TransactionType transactionType;
    uint256 amount;
    uint256 time;
  }

  address public organizer;
  function CarManager() { // Constructor
    organizer = msg.sender;
  }


  //用户信息
  mapping (address => User)  users;

  //汽车信息
  Car[] allCars;

  //汽车唯一标识
  uint256 carId = 0;

  //
  mapping  (uint256 => Car) carMap;



  function buyAutoCoin(uint256 buyAutoCoinSum,uint _cardId) payable
  returns (bool){
    Car car = carMap[_cardId];
    uint needEth = transferAutoCoin2Eth(buyAutoCoinSum,car.amount,car.price);
    require(msg.sender.balance >= needEth);
    if(msg.sender.balance >= needEth){
      if(sendEth(needEth,organizer)){
          users[msg.sender].property = users[msg.sender].property + buyAutoCoinSum;
          return true;
      }
    }
    return true;
  }


  function transferAutoCoin2Eth(uint256 buyAutoCoinSum,uint256 carAmount,uint256 carPrice) internal
  returns (uint256){
    return carPrice  * buyAutoCoinSum / carAmount;
  }


  function sendEth(uint256 amount,address receiveAddress) payable public
  onlyExistingUser
  returns (bool){
    require(msg.sender.balance >= amount);
    receiveAddress.transfer(amount);
    return true;
  }


  function returnCar(uint256 carId,bytes32 locationName) internal
  onlyExistingUser
  onlyExistingCar(carId)
  returns (bool){
    uint curTime = block.timestamp;
    Car car = carMap[carId];
    require(car.carStatus == CarStatus.USING);
    User user = users[msg.sender];
    RentInfo[] rentInfos = car.rentInfos;
    car.location = locationName;
    require(user.add == rentInfos[rentInfos.length -1].user.add);

    uint256 useTime = curTime - rentInfos[rentInfos.length -1 ].startTime;
    uint256 useAmount= useTime/1000/60/60 * car.rentAmount;

    Stock[] stocks = car.stocks;
    for(uint256 i = 0 ; i < stocks.length; ++i){
      uint256 incomeAmount = useAmount * stocks[i].amount / car.amount;
      if(stocks[i].user.add == msg.sender){
        users[msg.sender].property -= (useAmount - incomeAmount);
      }else{
        users[stocks[i].user.add].property += incomeAmount;
      }
      Transaction incomeTransaction;
      incomeTransaction.user = user;
      incomeTransaction.transactionType = TransactionType.INCOME;
      incomeTransaction.amount = incomeAmount;
      incomeTransaction.time = curTime;
      users[stocks[i].user.add].transactions.push(transaction);
    }
    Car[] usingCars = user.usingCars;
    Car[] newUsingCars;
    for(i = 0 ; i < usingCars.length; ++i){
      if(car.carId != usingCars[i].carId){
        newUsingCars.push(usingCars[i]);
      }
    }
    user.usingCars = newUsingCars;
    car.carStatus = CarStatus.FREE;
    rentInfos[rentInfos.length-1].endTime = curTime;
    Transaction transaction;
    transaction.user = user;
    transaction.transactionType = TransactionType.RENT;
    transaction.amount = useAmount;
    transaction.time = curTime;
    user.transactions.push(transaction);
    return true;
  }

  function checkUserHasTheCar(uint256 _carId) internal
  onlyExistingUser
  onlyExistingCar(_carId)
  returns (bool){
    Car car = carMap[_carId];
    Stock[] stocks = car.stocks;
    for(uint256 i = 0 ; i < stocks.length; ++i){
      if(stocks[i].user.add == msg.sender){
        return true;
      }
    }
    return false;
  }



  function rentNewCar(uint256 _carId) public
  onlyExistingUser
  onlyExistingCar(_carId)
  returns (bool){
    require(checkUserHasTheCar(_carId));
    uint curTime = block.timestamp;
    Car car = carMap[_carId];
    require(car.carStatus == CarStatus.FREE);
    car.carStatus = CarStatus.USING;
    User user = users[msg.sender];
    RentInfo rentInfo;
    rentInfo.startTime = curTime;
    rentInfo.endTime = 0;
    rentInfo.amount = 0;
    rentInfo.user = user;
    car.rentInfos.push(rentInfo);
    user.usingCars.push(car);
    return true;
  }


  function raisingNewCar(bytes32 carName,bytes32 desc,uint256 price,uint256 amount,bytes32 img,uint256 soldAmount,uint256 rentAmount) public
  onlyExistingUser
  returns (bool){
    carId = carId + 1;
    Car newCar;
    User user = users[msg.sender];
    newCar.carId = carId;
    newCar.name = carName;
    newCar.location = "    ";
    newCar.carStatus = CarStatus.RAISING;
    newCar.desc = desc;
    newCar.price = price;
    newCar.img = img;
    newCar.rentAmount = rentAmount;
    uint256 selfAmount = amount - soldAmount;
    Stock  stock;
    stock.user = user;
    stock.amount = selfAmount;
    Stock[] stocks;
    stocks.push(stock);
    newCar.stocks = stocks;
    newCar.owner = user;
    carMap[carId] = newCar;
    allCars.push(newCar);
    return true;
  }



  function buyNewCar(uint256 _carId,uint256 amount) public
  onlyExistingUser
  onlyExistingCar(_carId)
  returns (bool){
    uint curTime = block.timestamp;
    require(!carIsFinishRaise(_carId));
    Car car = carMap[_carId];
    uint256 needEth = transferAutoCoin2Eth(amount,car.amount,car.price);
    require(msg.sender.balance >= needEth);
    Stock[] stocks = car.stocks;
    uint256 raisedAmount = 0;
    for(uint i = 0 ; i < stocks.length ; ++i){
      raisedAmount += stocks[i].amount;
    }
    require(raisedAmount + amount <= car.amount);
    if(msg.sender.balance >= needEth){
      if(buyAutoCoin(amount,_carId)){
        User user = users[msg.sender];
        Stock newStock;
        newStock.user  = user;
        newStock.amount = amount;
        car.stocks.push(newStock);
        user.havingCars.push(car);
        Transaction buyCarTransaction;
        buyCarTransaction.user = user;
        buyCarTransaction.transactionType = TransactionType.BUY;
        buyCarTransaction.amount = amount;
        buyCarTransaction.time = curTime;
        user.transactions.push(buyCarTransaction);
        if(carIsFinishRaise(_carId)){
          car.carStatus = CarStatus.FREE;
        }
      }
      car.owner.add.transfer(needEth);
      Transaction inComeTransaction;
      inComeTransaction.user = car.owner;
      inComeTransaction.transactionType = TransactionType.INCOME;
      inComeTransaction.amount = amount;
      inComeTransaction.time = curTime;
      car.owner.transactions.push(inComeTransaction);
    }
  }



  function carIsFinishRaise(uint256 _carId) internal
  onlyExistingCar(_carId)
  returns (bool){
    Car car = carMap[_carId];
    Stock[] stocks = car.stocks;
    uint256 raisedAmount = 0;
    for(uint i = 0 ; i < stocks.length ; ++i){
      raisedAmount += stocks[i].amount;
    }
    return raisedAmount == car.amount ;

  }



  function getAllCarsBelongedToUserCnt() public
  onlyExistingUser
  returns(uint256){
    User user = users[msg.sender];
    Car[] cars;
    for(uint i =0 ; i < user.havingCars.length; ++i){
      cars.push(user.havingCars[i]);
    }
    return cars.length;
  }

  function getAllCarsBelongedToUser1(uint256 cur) public
  onlyExistingUser
  returns(uint256,bytes32 ,bytes32 ,uint256 ,uint256){
    User user = users[msg.sender];
    Car[] cars;
    for(uint i =0 ; i < user.havingCars.length; ++i){
      cars.push(user.havingCars[i]);
    }
    return (cars[cur].carId,cars[cur].name,cars[cur].location,cars[cur].amount,cars[cur].price);
  }


  function getAllCarsBelongedToUser2(uint256 cur) public
  onlyExistingUser
  returns(bytes32 ,uint256 ,CarStatus ,bytes32){
    User user = users[msg.sender];
    Car[] cars;
    for(uint i =0 ; i < user.havingCars.length; ++i){
      cars.push(user.havingCars[i]);
    }
    return (cars[cur].desc,cars[cur].rentAmount,cars[cur].carStatus,cars[cur].img);
  }


  function getAllCarsUserUsing() internal
  onlyExistingUser
  returns (Car[]){
    User user = users[msg.sender];
    Car[] cars;
    for(uint i =0 ; i < user.usingCars.length; ++i){
      cars.push(user.usingCars[i]);
    }
    return cars;
  }


  function getCarDetail(uint256 _carId) internal
  onlyExistingUser
  onlyExistingCar(_carId)
  returns (Car){
    return carMap[_carId];
  }



  function getAllCars() internal
  onlyExistingUser
  returns (Car[]){
    return allCars;
  }



  function getFreeCardList() internal
  returns (Car[]){
    Car[] res;
    for(uint i = 0; i < allCars.length; i++) {
      if(allCars[i].carStatus == CarStatus.FREE){
        res.push(allCars[i]);
      }
    }
    return res;
  }



  function getRaisingCardList() internal
  returns (Car[]){
    Car[] res;
    for(uint i = 0; i < allCars.length; i++) {
      if(allCars[i].carStatus == CarStatus.RAISING){
        res.push(allCars[i]);
      }
    }
    return res;
  }


  function getUserTransactionList() internal
  onlyExistingUser
  returns (Transaction[]){
    return users[msg.sender].transactions;
  }


  function getUserDetail() internal
  onlyExistingUser
  returns (User){
    return users[msg.sender];
  }


  modifier onlyExistingCar (uint256 _carId){
    require(!(carMap[_carId].name == 0x0));
    _;
  }


  modifier onlyExistingUser {
    require(!(users[msg.sender].name == 0x0));
    _;
  }

  modifier onlyValidName(bytes32 name) {
    require(!(name == 0x0));
    _;
  }

  function login() constant public
  onlyExistingUser
  returns (bytes32) {
    return (users[msg.sender].name);
  }

  function signup(bytes32 name) public payable
  onlyValidName(name)
  returns (bytes32) {
    if (users[msg.sender].name == 0x0) {
      users[msg.sender].name = name;
      users[msg.sender].add = msg.sender;
      return (users[msg.sender].name);
    }
    return (users[msg.sender].name);
  }

  function update(bytes32 name) public payable
  onlyValidName(name)
  onlyExistingUser
  returns (bytes32) {

    if (users[msg.sender].name != 0x0)
    {
      users[msg.sender].name = name;

      return (users[msg.sender].name);
    }
  }

  function test(uint256 a,uint256 b) public
  returns (uint256){
    return a+b;
  }



}
