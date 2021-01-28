contract C {
    function f() public returns (uint256 r) {
        for (uint256 x = 0; x < 10; ++x)
            assembly {
                r := add(r, x)
            }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 45
// gas Legacy: 23291
// gas LegacyOptimized: 22542
// gas Yul: 25497
// gas YulOptimized: 22392
