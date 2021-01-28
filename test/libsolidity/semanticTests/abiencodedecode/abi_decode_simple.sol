contract C {
    function f(bytes memory data) public pure returns (uint256, bytes memory) {
        return abi.decode(data, (uint256, bytes));
    }
}

// ====
// compileViaYul: also
// ----
// f(bytes): 0x20, 0x80, 0x21, 0x40, 0x7, "abcdefg" -> 0x21, 0x40, 0x7, "abcdefg"
// gas Legacy: 24672
// gas LegacyOptimized: 23587
// gas Yul: 25081
// gas YulOptimized: 23720
