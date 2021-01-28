contract C {
    uint x;
    uint y;
    fallback () payable external { ++x; }
    receive () payable external { ++y; }
    function f() external returns (uint, uint) { return (x, y); }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0, 0
// gas Legacy: 23093
// gas LegacyOptimized: 22894
// gas Yul: 23858
// gas YulOptimized: 22851
// () ->
// gas Legacy: 42009
// gas LegacyOptimized: 41942
// gas Yul: 43322
// gas YulOptimized: 41952
// f() -> 0, 1
// gas Legacy: 23093
// gas LegacyOptimized: 22894
// gas Yul: 23858
// gas YulOptimized: 22851
// (), 1 ether ->
// gas Legacy: 22809
// gas LegacyOptimized: 22742
// gas Yul: 24122
// gas YulOptimized: 22752
// f() -> 0, 2
// gas Legacy: 23093
// gas LegacyOptimized: 22894
// gas Yul: 23858
// gas YulOptimized: 22851
// (): 1 ->
// gas Legacy: 42179
// gas LegacyOptimized: 42112
// gas Yul: 43542
// gas YulOptimized: 42133
// f() -> 1, 2
// gas Legacy: 23093
// gas LegacyOptimized: 22894
// gas Yul: 23858
// gas YulOptimized: 22851
// (), 1 ether: 1 ->
// gas Legacy: 22979
// gas LegacyOptimized: 22912
// gas Yul: 24342
// gas YulOptimized: 22933
// f() -> 2, 2
// gas Legacy: 23093
// gas LegacyOptimized: 22894
// gas Yul: 23858
// gas YulOptimized: 22851
