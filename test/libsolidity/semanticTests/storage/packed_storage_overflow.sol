contract C {
    uint16 x = 0x1234;
    uint16 a = 0xffff;
    uint16 b;

    function f() public returns (uint256, uint256, uint256, uint256) {
        unchecked { a++; }
        uint256 c = b;
        delete b;
        unchecked { a -= 2; }
        return (x, c, b, a);
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x1234, 0x0, 0x0, 0xfffe
// gas Legacy: 32211
// gas LegacyOptimized: 23160
// gas Yul: 34682
// gas YulOptimized: 28136
