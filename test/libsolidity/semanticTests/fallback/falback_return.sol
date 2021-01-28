contract A {
    uint public x;
    fallback () external {
        if (x == 2) return;
        x++;
    }
}
// ====
// compileViaYul: also
// ----
// ()
// gas Legacy: 42852
// gas LegacyOptimized: 42783
// gas Yul: 44472
// gas YulOptimized: 41962
// x() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
// ()
// gas Legacy: 23652
// gas LegacyOptimized: 23583
// gas Yul: 25272
// gas YulOptimized: 22762
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
// ()
// gas Legacy: 21902
// gas LegacyOptimized: 21901
// gas Yul: 22252
// gas YulOptimized: 21931
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
// ()
// gas Legacy: 21902
// gas LegacyOptimized: 21901
// gas Yul: 22252
// gas YulOptimized: 21931
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
