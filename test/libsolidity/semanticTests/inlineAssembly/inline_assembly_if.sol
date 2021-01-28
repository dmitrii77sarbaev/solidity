contract C {
    function f(uint256 a) public returns (uint256 b) {
        assembly {
            if gt(a, 1) {
                b := 2
            }
        }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 0 -> 0
// gas Legacy: 21790
// gas LegacyOptimized: 21506
// gas Yul: 22089
// gas YulOptimized: 21391
// f(uint256): 1 -> 0
// gas Legacy: 21802
// gas LegacyOptimized: 21518
// gas Yul: 22101
// gas YulOptimized: 21403
// f(uint256): 2 -> 2
// gas Legacy: 21810
// gas LegacyOptimized: 21523
// gas Yul: 22109
// gas YulOptimized: 21411
// f(uint256): 3 -> 2
// gas Legacy: 21810
// gas LegacyOptimized: 21523
// gas Yul: 22109
// gas YulOptimized: 21411
