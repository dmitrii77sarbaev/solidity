contract C {
    function f(bytes calldata data)
        external
        pure
        returns (uint256, bytes memory r)
    {
        return abi.decode(data, (uint256, bytes));
    }
}

// ====
// compileViaYul: also
// ----
// f(bytes): 0x20, 0x80, 0x21, 0x40, 0x7, "abcdefg" -> 0x21, 0x40, 0x7, "abcdefg"
// gas Legacy: 24063
// gas LegacyOptimized: 23141
// gas Yul: 24432
// gas YulOptimized: 23221
