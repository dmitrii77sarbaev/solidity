contract test {
    function a() public returns(uint n) { return 0; }
    function b() public returns(uint n) { return 1; }
    function c() public returns(uint n) { return 2; }
    function f() public returns(uint n) { return 3; }
}
// ====
// allowNonExistingFunctions: true
// compileToEwasm: also
// compileViaYul: also
// ----
// a() -> 0
// gas Legacy: 21371
// gas LegacyOptimized: 21270
// gas Yul: 21849
// gas YulOptimized: 21437
// b() -> 1
// gas Legacy: 21423
// gas LegacyOptimized: 21314
// gas Yul: 21893
// gas YulOptimized: 21481
// c() -> 2
// gas Legacy: 21445
// gas LegacyOptimized: 21336
// gas Yul: 21915
// gas YulOptimized: 21503
// f() -> 3
// gas Legacy: 21401
// gas LegacyOptimized: 21292
// gas Yul: 21871
// gas YulOptimized: 21459
// i_am_not_there() -> FAILURE
// gas Legacy: 21234
// gas LegacyOptimized: 21234
// gas Yul: 21281
// gas YulOptimized: 21235
