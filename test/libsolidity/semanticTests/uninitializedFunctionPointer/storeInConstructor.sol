contract InvalidTest {

  function() internal storedFn;

  bool flag;

  constructor() {
    function() internal invalid;
    storedFn = invalid;
  }
  function f() public returns (uint) {
    if (flag) return 2;
    flag = true;
    storedFn();
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 24698
// gas LegacyOptimized: 23739
// gas Yul: 44518
// gas YulOptimized: 42113
// f() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 24698
// gas LegacyOptimized: 23739
// gas Yul: 44518
// gas YulOptimized: 42113
