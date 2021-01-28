function f() pure returns (uint) { return 1337; }
contract C {
  function f() public pure returns (uint) {
    return f();
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE
// gas Legacy: 100000000
// gas LegacyOptimized: 100000000
// gas Yul: 100000000
// gas YulOptimized: 100000000
