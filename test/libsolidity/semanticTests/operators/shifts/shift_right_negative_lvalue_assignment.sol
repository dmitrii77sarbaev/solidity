contract C {
    function f(int256 a, uint256 b) public returns (int256) {
        a >>= b;
        return a;
    }
}

// ====
// compileViaYul: also
// ----
// f(int256,uint256): -4266, 0 -> -4266
// gas Legacy: 22474
// gas LegacyOptimized: 22010
// gas Yul: 23018
// gas YulOptimized: 21878
// f(int256,uint256): -4266, 1 -> -2133
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4266, 4 -> -267
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4266, 8 -> -17
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4266, 16 -> -1
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4266, 17 -> -1
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4267, 0 -> -4267
// gas Legacy: 22474
// gas LegacyOptimized: 22010
// gas Yul: 23018
// gas YulOptimized: 21878
// f(int256,uint256): -4267, 1 -> -2134
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4267, 4 -> -267
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4267, 8 -> -17
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4267, 16 -> -1
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
// f(int256,uint256): -4267, 17 -> -1
// gas Legacy: 22486
// gas LegacyOptimized: 22022
// gas Yul: 23030
// gas YulOptimized: 21890
