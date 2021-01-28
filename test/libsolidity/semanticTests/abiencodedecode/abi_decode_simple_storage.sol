contract C {
    bytes data;

    function f(bytes memory _data) public returns (uint256, bytes memory) {
        data = _data;
        return abi.decode(data, (uint256, bytes));
    }
}

// ====
// compileViaYul: also
// ----
// f(bytes): 0x20, 0x80, 0x21, 0x40, 0x7, "abcdefg" -> 0x21, 0x40, 0x7, "abcdefg"
// gas Legacy: 131690
// gas LegacyOptimized: 130574
// gas Yul: 131995
// gas YulOptimized: 130305
