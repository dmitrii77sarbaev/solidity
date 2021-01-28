contract C {
    function f() public returns (uint256 x, uint256 y) {
        x = 3;
        y = 6;
        uint256[2] memory z = [x, y];
        return (z[0], z[1]);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 3, 6
// gas Legacy: 21655
// gas LegacyOptimized: 21354
// gas Yul: 23272
// gas YulOptimized: 21715
