contract A {
    uint data;
    receive() external payable { ++data; }
    function getData() public returns (uint r) { return data; }
}
contract B is A {}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// getData() -> 0
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22742
// gas YulOptimized: 22034
// () ->
// gas Legacy: 42009
// gas LegacyOptimized: 41942
// gas Yul: 43322
// gas YulOptimized: 41913
// getData() -> 1
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22742
// gas YulOptimized: 22034
// (), 1 ether ->
// gas Legacy: 22809
// gas LegacyOptimized: 22742
// gas Yul: 24122
// gas YulOptimized: 22713
// getData() -> 2
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22742
// gas YulOptimized: 22034
