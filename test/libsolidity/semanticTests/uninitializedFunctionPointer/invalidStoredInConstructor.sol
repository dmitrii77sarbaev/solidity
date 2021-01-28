contract C {

  function() internal storedFn;

  bool flag;

  constructor() {
    if (!flag) {
      flag = true;
      function() internal invalid;
      storedFn = invalid;
      storedFn();
    }
  }
  function f() public pure {}
}
contract Test {
  function f() public {
    new C();
  }
}
// ====
// compileViaYul: also
// ----
// f() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 85036
// gas LegacyOptimized: 82446
// gas Yul: 86088
// gas YulOptimized: 82300
