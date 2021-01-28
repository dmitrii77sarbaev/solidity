contract C {
    function f() public returns (uint i) {
        assembly {
            for {} lt(i, 10) { i := add(i, 1) }
            {
                if eq(i, 6) { break }
                i := add(i, 1)
            }
        }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 6
// gas Legacy: 21707
// gas LegacyOptimized: 21540
// gas Yul: 22091
// gas YulOptimized: 21746
