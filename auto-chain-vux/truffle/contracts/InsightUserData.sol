pragma solidity ^0.4.17;
import "./MatrixBasicData.sol";
import "../../node_modules/zeppelin-solidity/contracts/lifecycle/Pausable.sol";


contract InsightUserData is MatrixBasicData, Pausable {

    MatrixBasicData matrix;

    address public matrixAddr;

    function computeMatrixData(bytes32[] fields, bytes32[] values) public view returns (uint256 result) {
      require(fields.length == values.length);

      bytes32 gender = bytes32("userGender");
      bytes32 age = bytes32("userAge");
      uint8 count = 0;
      uint256 genderValue = 0;
      uint256 ageValue = 0;

      for (uint128 i = 0; i < fields.length; i++) {
        if (fields[i] == gender) {
          genderValue = uint256(values[i]);
          count++;
        }
        if (fields[i] == age) {
          ageValue = uint256(values[i]);
          count++;
        }

        if (count == 2) {
          break;
        }
      }
      result = uint256((ageValue >> 224) | (genderValue >> 248)); // the value is 'utf8' here, check wiki: http://wiki.n.miui.com/pages/viewpage.action?pageId=74820527
    }

    function InsightUserData(address _address) public onlyOwner {
      require(_address != address(0));
      matrix = MatrixBasicData(_address);
      matrixAddr = _address;
    }

    function setMatrixAddress(address _address) public onlyOwner {
      require(_address != address(0));
      matrix = MatrixBasicData(_address);
      matrixAddr = _address;
    }

    function analysis(address user, bytes32[] fields) public view returns (uint256 result) {
        require(user != address(0));
        result = matrix.compute(user, fields, this);
    }
}
