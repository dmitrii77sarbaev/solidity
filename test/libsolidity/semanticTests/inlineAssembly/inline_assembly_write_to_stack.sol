contract C {
    function f() public returns (uint256 r, bytes32 r2) {
        assembly {
            r := 7
            r2 := "abcdef"
        }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 7, "abcdef"
// gas Legacy: 21493
// gas LegacyOptimized: 21300
// gas Yul: 21920
// gas YulOptimized: 21241
