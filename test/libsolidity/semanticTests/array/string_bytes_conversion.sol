contract Test {
    string s;
    bytes b;

    function f(string memory _s, uint256 n) public returns (bytes1) {
        b = bytes(_s);
        s = string(b);
        return bytes(s)[n];
    }

    function l() public returns (uint256) {
        return bytes(s).length;
    }
}
// ====
// compileViaYul: also
// ----
// f(string,uint256): 0x40, 0x02, 0x06, "abcdef" -> "c"
// gas Legacy: 69723
// gas LegacyOptimized: 69055
// gas Yul: 70288
// gas YulOptimized: 68577
// l() -> 0x06
// gas Legacy: 22337
// gas LegacyOptimized: 22225
// gas Yul: 22811
// gas YulOptimized: 22394
