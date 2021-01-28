library L {
    function f(uint256 v) external returns (uint256) { return v*v; }
}
contract C {
    function g(uint256 v) external returns (uint256) {
        return L.f(v);
    }
}
// ====
// compileViaYul: also
// ----
// library: L// g(uint256): 1 -> 1
// gas Legacy: 24551
// gas LegacyOptimized: 23596
// gas Yul: 25396
// gas YulOptimized: 23663
// g(uint256): 2 -> 4
// gas Legacy: 24551
// gas LegacyOptimized: 23596
// gas Yul: 25396
// gas YulOptimized: 23663
// g(uint256): 4 -> 16
// gas Legacy: 24551
// gas LegacyOptimized: 23596
// gas Yul: 25396
// gas YulOptimized: 23663
