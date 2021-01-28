contract A {
    uint public x;
    receive () external payable { ++x; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// x() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
// ()
// gas Legacy: 42009
// gas LegacyOptimized: 41942
// gas Yul: 43322
// gas YulOptimized: 41913
// x() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
// (), 1 wei
// gas Legacy: 22809
// gas LegacyOptimized: 22742
// gas Yul: 24122
// gas YulOptimized: 22713
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
// x(), 1 wei -> FAILURE
// gas Legacy: 21165
// gas LegacyOptimized: 21165
// gas Yul: 21211
// gas YulOptimized: 21170
// (): hex"00" -> FAILURE
// gas Legacy: 21066
// gas LegacyOptimized: 21066
// gas Yul: 21078
// gas YulOptimized: 21078
// (), 1 ether: hex"00" -> FAILURE
// gas Legacy: 21066
// gas LegacyOptimized: 21066
// gas Yul: 21078
// gas YulOptimized: 21078
