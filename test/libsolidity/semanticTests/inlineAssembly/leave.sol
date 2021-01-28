contract C {
    function f() public pure returns (uint w) {
        assembly {
            function f() -> t {
                t := 2
                leave
                t := 9
            }
            w := f()
        }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 21426
// gas LegacyOptimized: 21317
// gas Yul: 21796
// gas YulOptimized: 21229
