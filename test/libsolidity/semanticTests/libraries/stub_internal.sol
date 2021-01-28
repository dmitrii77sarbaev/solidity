library L {
    function f(uint256 v) internal returns (uint256) { return v*v; }
}
contract C {
    function g(uint256 v) external returns (uint256) {
        return L.f(v);
    }
}
// ====
// compileViaYul: also
// ----
// g(uint256): 1 -> 1
// gas Legacy: 22037
// gas LegacyOptimized: 21626
// gas Yul: 22381
// gas YulOptimized: 21607
// g(uint256): 2 -> 4
// gas Legacy: 22037
// gas LegacyOptimized: 21626
// gas Yul: 22381
// gas YulOptimized: 21607
// g(uint256): 4 -> 16
// gas Legacy: 22037
// gas LegacyOptimized: 21626
// gas Yul: 22381
// gas YulOptimized: 21607
