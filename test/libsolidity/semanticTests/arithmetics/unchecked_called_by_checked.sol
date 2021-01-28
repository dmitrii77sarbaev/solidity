contract C {
    function add(uint16 a, uint16 b) public returns (uint16) {
        unchecked {
            return a + b;
        }
    }

    function f(uint16 a) public returns (uint16) {
        return add(a, 0x100) + 0x100;
    }
}
// ====
// compileViaYul: also
// ----
// f(uint16): 7 -> 0x0207
// gas Legacy: 22078
// gas LegacyOptimized: 21740
// gas Yul: 22712
// gas YulOptimized: 21802
// f(uint16): 0xffff -> 511
// gas Legacy: 22090
// gas LegacyOptimized: 21752
// gas Yul: 22724
// gas YulOptimized: 21814
// f(uint16): 0xfeff -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 21888
// gas LegacyOptimized: 21642
// gas Yul: 22298
// gas YulOptimized: 21596
