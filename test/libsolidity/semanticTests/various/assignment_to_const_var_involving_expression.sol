contract C {
    uint256 constant x = 0x123 + 0x456;

    function f() public returns (uint256) {
        return x + 1;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x57a
// gas Legacy: 21573
// gas LegacyOptimized: 21345
// gas Yul: 22171
// gas YulOptimized: 21229
