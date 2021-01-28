contract test {
    function f(uint256 k) public returns (uint256) {
        return k;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 9 -> 9
// gas Legacy: 21784
// gas LegacyOptimized: 21484
// gas Yul: 22083
// gas YulOptimized: 21369
