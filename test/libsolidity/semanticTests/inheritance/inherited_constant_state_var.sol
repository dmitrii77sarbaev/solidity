contract A {
    uint256 constant x = 7;
}


contract B is A {
    function f() public returns (uint256) {
        return A.x;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 7
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21884
// gas YulOptimized: 21229
