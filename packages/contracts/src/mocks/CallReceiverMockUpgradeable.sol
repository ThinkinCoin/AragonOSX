// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "../proxy/utils/initializable.sol";

contract CallReceiverMockUpgradeable is Initializable {
    event MockFunctionCalled();
    event MockFunctionCalledWithArgs(uint256 a, uint256 b);

    uint256[] private _array;

    function __CallReceiverMock_init() internal onlyInitializing {
    }

    function __CallReceiverMock_init_unchained() internal onlyInitializing {
    }
    function mockFunction() public payable returns (string memory) {
        emit MockFunctionCalled();

        return "0x1234";
    }

    function mockFunctionEmptyReturn() public payable {
        emit MockFunctionCalled();
    }

    function mockFunctionWithArgs(uint256 a, uint256 b) public payable returns (string memory) {
        emit MockFunctionCalledWithArgs(a, b);

        return "0x1234";
    }

    function mockFunctionNonPayable() public returns (string memory) {
        emit MockFunctionCalled();

        return "0x1234";
    }

    function mockStaticFunction() public pure returns (string memory) {
        return "0x1234";
    }

    function mockFunctionRevertsNoReason() public payable {
        revert();
    }

    function mockFunctionRevertsReason() public payable {
        revert("CallReceiverMock: reverting");
    }

    function mockFunctionThrows() public payable {
        assert(false);
    }

    function mockFunctionOutOfGas() public payable {
        for (uint256 i = 0; ; ++i) {
            _array.push(i);
        }
    }

    function mockFunctionWritesStorage(bytes32 slot, bytes32 value) public returns (string memory) {
        assembly {
            sstore(slot, value)
        }
        return "0x1234";
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
