pragma solidity ^0.4.18;


contract CarManager  {

  enum CarStatus { RAISING,//募集
                    FREE, //闲置
                    BID_USE,//竞价使用
                    USING, //正在使用
                    SOLD_OUT_ING //售出
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
    ufixed longitude;//经度
    ufixed latitude;//纬度
    bytes32 name;
  }

  struct Stock{
    User user;
    uint8 percent;
    uint256 price;
  }

  struct Car{
    uint carId;
    bytes32 name;
    Location location;
    uint256 price;
    bytes32 desc;
    CarStatus carStatus;
    bytes32[] imgs;
    Stock[] stocks;
    RentInfo[] rentInfos;
  }

  struct RentInfo{
    uint256 startTime;
    uint256 endTime;
    uint256 price;
    User user;
  }


  struct Transaction{
    User user;
    TransactionType transactionType;
    uint256 price;
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
  mapping (uint256 => Car) carMap;



  function buyAutoCoin(uint256 autoCoinSum) payable
  returns (bool){
    uint needEth = transferAutoCoin2Eth(autoCoinSum);
    require(msg.sender.balance >= needEth);
    if(msg.sender.balance >= needEth){
      if(sendEth(needEth,organizer)){
          users[msg.sender].property = users[msg.sender].property + autoCoinSum;
          return true;
      }
    }
    return true;
  }

  function transferEth2AutoCoin(uint256 ethSum)
  returns (uint256){
    return ethSum;
  }


  function transferAutoCoin2Eth(uint256 autoCoinSum)
  returns (uint256){
    return autoCoinSum;
  }


  function sendEth(uint256 amount,address receiveAddress) payable public
  onlyExistingUser
  returns (bool){
    require(msg.sender.balance >= amount);
    receiveAddress.transfer(amount);
    return true;
  }


  function returnCar(uint256 _carId,ufixed longitude,ufixed latitude,bytes32 locationName) internal
  onlyExistingUser
  onlyExistingCar(_carId)
  returns (bool){
    uint curTime = block.timestamp;
    Car car = carMap[_carId];
    require(car.carStatus == CarStatus.USING);
    User user = users[msg.sender];
    RentInfo[] rentInfos = car.rentInfos;
    Location memory location = Location(longitude,latitude,locationName);
    car.location = location;
    require(user.add == rentInfos[rentInfos.length -1].user.add);
    Car[] usingCars = user.usingCars;
    Car[] newUsingCars;
    for(uint i = 0 ; i < usingCars.length; ++i){
      if(car.carId != usingCars[i].carId){
        newUsingCars.push(usingCars[i]);
      }
    }
    user.usingCars = newUsingCars;
    car.carStatus = CarStatus.FREE;
    rentInfos[rentInfos.length].endTime = curTime;
    //TODO 计算价格转账
    return true;
  }


  function rentNewCar(uint256 _carId,uint256 price) internal
  onlyExistingUser
  onlyExistingCar(_carId)
  returns (bool){
    uint curTime = block.timestamp;
    Car car = carMap[_carId];
    require(car.carStatus == CarStatus.FREE);
    car.carStatus = CarStatus.USING;
    User user = users[msg.sender];
    RentInfo memory rentInfo = RentInfo(curTime,0,price,user);
    car.rentInfos.push(rentInfo);
    user.usingCars.push(car);
    Transaction memory transaction = Transaction(user,TransactionType.RENT,price,curTime);
    user.transactions.push(transaction);
    return true;
  }


  function raisingNewCar(bytes32 carName,bytes32 desc,uint price,bytes32[] imgs) internal
  onlyExistingUser
  returns (bool){
    ++carId;
    Location memory defaultLocation = Location(0,0,"");
    Car newCar;
    newCar.carId = carId;
    newCar.name = carName;
    newCar.location = defaultLocation;
    newCar.carStatus = CarStatus.RAISING;
    newCar.desc = desc;
    newCar.price = price;
    newCar.imgs = imgs;
    carMap[carId] = newCar;
    allCars.push(newCar);
    return true;
  }



  function buyNewCar(uint256 _carId,uint256 price,uint8 percent) internal
  onlyExistingUser
  onlyExistingCar(_carId)
  returns (bool){
    require(users[organizer].property >= price);
    if(users[organizer].property >= price){
      uint curTime = block.timestamp;
      require(!carIsFinishRaise(_carId));
      Car car = carMap[_carId];
      Stock[] stocks = car.stocks;
      uint256 raisedPrice = 0;
      uint8 raisedPercent = 0;
      for(uint i = 0 ; i < stocks.length ; ++i){
        raisedPrice += stocks[i].price;
        raisedPercent += stocks[i].percent;
      }
      require(raisedPrice + price <= car.price);
      require(raisedPercent + percent <= 100);
      users[organizer].property = users[organizer].property - price;
      User user = users[msg.sender];
      Stock memory newStock = Stock(user,percent,price);
      car.stocks.push(newStock);
      user.havingCars.push(car);
      Transaction memory transaction = Transaction(user,TransactionType.BUY,price,curTime);
      user.transactions.push(transaction);
      if(carIsFinishRaise(_carId)){
        car.carStatus = CarStatus.FREE;
      }
    }

  }



  function carIsFinishRaise(uint256 _carId) internal
  onlyExistingCar(_carId)
  returns (bool){
    Car car = carMap[_carId];
    Stock[] stocks = car.stocks;
    uint256 raisedPrice = 0;
    uint8 raisedPercent = 0;
    for(uint i = 0 ; i < stocks.length ; ++i){
      raisedPrice += stocks[i].price;
      raisedPercent += stocks[i].percent;
    }
    return raisedPrice == car.price && raisedPercent == 100;

  }



  function getAllCarsBelongedToUser() internal
  onlyExistingUser
  returns(Car[]){
    User user = users[msg.sender];
    Car[] cars;
    for(uint i =0 ; i < user.havingCars.length; ++i){
      cars.push(user.havingCars[i]);
    }
    return cars;
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


  function getCarListByStatus(CarStatus carStatus) internal
  onlyExistingUser
  returns (Car[]){
    Car[] res;
    for(uint i = 0; i < allCars.length; i++) {
      if(allCars[i].carStatus == carStatus){
        res.push(allCars[i]);
      }
    }
    return res;
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
