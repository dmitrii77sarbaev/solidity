contract C {
    function add(uint16 a, uint16 b) public returns (uint16) {
        return a + b;
    }

    function f(uint16 a, uint16 b, uint16 c) public returns (uint16) {
        unchecked { return add(a, b) + c; }
    }
}
// ====
// compileViaYul: also
// ----
// f(uint16,uint16,uint16): 0xe000, 0xe500, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22480
// gas LegacyOptimized: 22075
// gas Yul: 22619
// gas YulOptimized: 22086
// f(uint16,uint16,uint16): 0xe000, 0x1000, 0x1000 -> 0x00
// gas Legacy: 22713
// gas LegacyOptimized: 22209
// gas Yul: 23171
// gas YulOptimized: 22372
