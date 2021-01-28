contract A {
    uint data;
    fallback() external { data = 1; }
    function getData() public returns (uint r) { return data; }
}
contract B is A {}
// ====
// compileViaYul: also
// ----
// getData() -> 0
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22742
// gas YulOptimized: 22034
// (): 42 ->
// gas Legacy: 41263
// gas LegacyOptimized: 41244
// gas Yul: 42521
// gas YulOptimized: 41251
// getData() -> 1
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22742
// gas YulOptimized: 22034
