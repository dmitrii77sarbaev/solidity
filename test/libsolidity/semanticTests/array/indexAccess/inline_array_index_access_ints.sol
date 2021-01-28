contract C {
    function f() public returns (uint256) {
        return ([1, 2, 3, 4][2]);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 3
// gas Legacy: 21538
// gas LegacyOptimized: 21366
// gas Yul: 23325
// gas YulOptimized: 21595
