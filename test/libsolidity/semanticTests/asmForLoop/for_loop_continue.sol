contract C {
    function f() public returns (uint k) {
        assembly {
            for {let i := 0} lt(i, 10) { i := add(i, 1) }
            {
                if eq(mod(i, 2), 0) { continue }
                k := add(k, 1)
            }
        }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 5
// gas Legacy: 22383
// gas LegacyOptimized: 22092
// gas Yul: 22764
// gas YulOptimized: 22419
