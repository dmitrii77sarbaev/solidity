contract C {
    modifier add(uint16 a, uint16 b) {
        unchecked { a + b; }
        _;
    }

    function f(uint16 a, uint16 b, uint16 c) public add(a, b) returns (uint16) {
        return b + c;
    }
}
// ====
// compileViaYul: also
// ----
// f(uint16,uint16,uint16): 0xe000, 0xe500, 2 -> 58626
// gas Legacy: 22647
// gas LegacyOptimized: 22146
// gas Yul: 23084
// gas YulOptimized: 22158
// f(uint16,uint16,uint16): 0x1000, 0xe500, 0xe000 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22437
// gas LegacyOptimized: 22032
// gas Yul: 22598
// gas YulOptimized: 21968
