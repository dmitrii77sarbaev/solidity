contract Test {
    function set(uint24[3][4] memory x) public {
        x[2][2] = 1;
        x[3][2] = 7;
    }

    function f() public returns (uint24[3][4] memory) {
        uint24[3][4] memory data;
        set(data);
        return data;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x07
// gas Legacy: 28117
// gas LegacyOptimized: 24369
// gas Yul: 34425
// gas YulOptimized: 25920
