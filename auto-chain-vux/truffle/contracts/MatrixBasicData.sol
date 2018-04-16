pragma solidity ^0.4.0;

import "../../node_modules/zeppelin-solidity/contracts/ownership/rbac/RBAC.sol";

interface MatrixDataCallback {
  function computeMatrixData(bytes32[] fields, bytes32[] values) public view returns (uint256);
}

contract MatrixBasicData is RBAC {
  struct UserData {
    address user;
    mapping (bytes32 => bytes32) profile;
  }

  UserData[] userData;

  mapping (bytes16 => uint256) imeiToIndex;
  mapping (address => uint256) addressToIndex;

  function MatrixBasicData() public {
    userData.length = 1;
  }

  function totalUserCount() public view returns (uint256 total) {
    total = userData.length - 1;
  }

  function updateUserData(bytes16 imei, bytes32[] fields, bytes32[] values) public onlyAdmin {
    require(fields.length == values.length);

    uint256 idx = imeiToIndex[imei];
    if (idx == 0) {
      idx = userData.length;
      userData.length++;
      imeiToIndex[imei] = idx;
    }

    for (uint256 i = 0; i < fields.length; i++) {
      userData[idx].profile[fields[i]] = values[i];
    }
  }

  function registerAddress(address addr, bytes16 imei) public onlyAdmin {
    uint256 idx = imeiToIndex[imei];
    require(idx > 0);
    require(addressToIndex[addr] == 0);

    addressToIndex[addr] = idx;
    userData[idx].user = addr;
  }

  function compute(address addr, bytes32[] fields, address cb) public view returns (uint256) {
    uint256 idx = addressToIndex[addr];
    require(idx > 0);

    bytes32[] memory values = new bytes32[](fields.length);
    for (uint256 i = 0; i < fields.length; i++) {
      values[i] = userData[idx].profile[fields[i]];
    }

    MatrixDataCallback mdc = MatrixDataCallback(cb);
    return mdc.computeMatrixData(fields, values);
  }

  function countBy(bytes32[] fields, bytes32[] values, bool isRegistered) public view returns (uint256 count) {
    for (uint256 i = 1; i < userData.length; i++) {
      UserData storage u = userData[i];
      if (!isRegistered || u.user != address(0)) {
        bool flag = true;

        for (uint256 j = 0; j < fields.length; j++) {
          if (u.profile[fields[j]] != values[j]) {
            flag = false;
            break;
          }
        }

        if (flag) count++;
      }
    }
  }

  function coverageBy(bytes32[] fields, bool isRegistered) public view returns (uint256 count) {
    for (uint256 i = 1; i < userData.length; i++) {
      UserData storage u = userData[i];
      if (!isRegistered || u.user != address(0)) {
        bool flag = true;

        for (uint256 j = 0; j < fields.length; j++) {
          if (u.profile[fields[j]] == bytes32(0)) {
            flag = false;
            break;
          }
        }

        if (flag) count++;
      }
    }
  }
}
