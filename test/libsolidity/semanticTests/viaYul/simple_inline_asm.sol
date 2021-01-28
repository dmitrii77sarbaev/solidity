contract C {
    function f() public pure returns (uint32 x) {
        uint32 a;
        uint32 b;
        uint32 c;
        assembly {
            a := 1
            b := 2
            c := 3
        }
        x = a + b + c;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 6
// gas Legacy: 21836
// gas LegacyOptimized: 21511
// gas Yul: 22235
// gas YulOptimized: 21559
