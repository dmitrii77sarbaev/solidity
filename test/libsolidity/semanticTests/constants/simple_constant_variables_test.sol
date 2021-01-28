contract Foo {
    function getX() public returns (uint256 r) {
        return x;
    }

    uint256 constant x = 56;
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// getX() -> 56
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21884
// gas YulOptimized: 21229
