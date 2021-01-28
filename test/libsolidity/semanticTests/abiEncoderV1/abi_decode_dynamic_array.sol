contract C {
    function f(bytes calldata data) external pure returns (uint256[] memory) {
        return abi.decode(data, (uint256[]));
    }
}

// ====
// compileViaYul: also
// ----
// f(bytes): 0x20, 0xc0, 0x20, 0x4, 0x3, 0x4, 0x5, 0x6 -> 0x20, 0x4, 0x3, 0x4, 0x5, 0x6
// gas Legacy: 25792
// gas LegacyOptimized: 23842
// gas Yul: 26117
// gas YulOptimized: 24019
