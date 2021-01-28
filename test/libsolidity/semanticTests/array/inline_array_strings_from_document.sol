contract C {
    function f(uint256 i) public returns (string memory) {
        string[4] memory x = ["This", "is", "an", "array"];
        return (x[i]);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 0 -> 0x20, 0x4, "This"
// gas Legacy: 22499
// gas LegacyOptimized: 22093
// gas Yul: 25401
// gas YulOptimized: 23041
// f(uint256): 1 -> 0x20, 0x2, "is"
// gas Legacy: 22511
// gas LegacyOptimized: 22105
// gas Yul: 25413
// gas YulOptimized: 23053
// f(uint256): 2 -> 0x20, 0x2, "an"
// gas Legacy: 22511
// gas LegacyOptimized: 22105
// gas Yul: 25413
// gas YulOptimized: 23053
// f(uint256): 3 -> 0x20, 0x5, "array"
// gas Legacy: 22511
// gas LegacyOptimized: 22105
// gas Yul: 25413
// gas YulOptimized: 23053
