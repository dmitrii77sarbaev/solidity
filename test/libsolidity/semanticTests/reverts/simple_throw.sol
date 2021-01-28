contract Test {
    function f(uint256 x) public returns (uint256) {
        if (x > 10) return x + 10;
        else revert();
        return 2;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 11 -> 21
// gas Legacy: 22015
// gas LegacyOptimized: 21589
// gas Yul: 22541
// gas YulOptimized: 21591
// f(uint256): 1 -> FAILURE
// gas Legacy: 21612
// gas LegacyOptimized: 21429
// gas Yul: 21822
// gas YulOptimized: 21401
