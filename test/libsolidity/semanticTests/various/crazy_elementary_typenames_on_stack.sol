contract C {
    function f() public returns (uint256 r) {
        uint256;
        uint256;
        uint256;
        uint256;
        int256 x = -7;
        return uint256(x);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> -7
// gas Legacy: 21392
// gas LegacyOptimized: 21273
// gas Yul: 21939
// gas YulOptimized: 21232
