contract C {
    struct s {
        uint256 a;
        uint256 b;
    }

    function f() public returns (uint256) {
        s[7][]; // This is only the type, should not have any effect
        return 3;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 3
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21848
// gas YulOptimized: 21229
