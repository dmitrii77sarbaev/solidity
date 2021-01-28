contract C {
    function test() public returns (uint256, uint256) {
        uint32 a = 0xffffffff;
        uint16 x = uint16(a);
        uint16 y = x;
        x /= 0x100;
        y = y / 0x100;
        return (x, y);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() -> 0xff, 0xff
// gas Legacy: 21962
// gas LegacyOptimized: 21524
// gas Yul: 22879
// gas YulOptimized: 21578
