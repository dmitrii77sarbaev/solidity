contract C {
    function f(bytes calldata data)
        external
        pure
        returns (uint256[2][3] memory)
    {
        return abi.decode(data, (uint256[2][3]));
    }
}

// ====
// compileViaYul: also
// ----
// f(bytes): 0x20, 0xc0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6 -> 1, 2, 3, 4, 5, 6
// gas Legacy: 30262
// gas LegacyOptimized: 26060
// gas Yul: 32526
// gas YulOptimized: 27446
