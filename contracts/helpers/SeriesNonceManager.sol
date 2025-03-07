// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;
pragma abicoder v1;

/// @title A helper contract to manage nonce with the series
contract SeriesNonceManager {
    error AdvanceNonceFailed();
    event NonceIncreased(address indexed maker, uint256 series, uint256 newNonce);

    // {
    //    1: {
    //        '0x762f73Ad...842Ffa8': 0,
    //        '0xd20c41ee...32aaDe2': 1
    //    },
    //    2: {
    //        '0x762f73Ad...842Ffa8': 3,
    //        '0xd20c41ee...32aaDe2': 15
    //    },
    //    ...
    // }
    mapping(uint256 => mapping(address => uint256)) public nonce;

    /// @notice Advances nonce by one
    function increaseNonce(uint8 series) external {
        advanceNonce(series, 1);
    }

    /// @notice Advances nonce by specified amount
    function advanceNonce(uint256 series, uint256 amount) public {
        if (amount == 0 || amount > 255) revert AdvanceNonceFailed();
        unchecked {
            uint256 newNonce = nonce[series][msg.sender] + amount;
            nonce[series][msg.sender] = newNonce;
            emit NonceIncreased(msg.sender, series, newNonce);
        }
    }

    /// @notice Checks if `makerAddress` has specified `makerNonce` for `series`
    /// @return Result True if `makerAddress` has specified nonce. Otherwise, false
    function nonceEquals(uint256 series, address makerAddress, uint256 makerNonce) external view returns(bool) {
        return nonce[series][makerAddress] == makerNonce;
    }
}
