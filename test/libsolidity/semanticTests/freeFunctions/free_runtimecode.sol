contract C {
  uint public x = 2;
}

function test() returns (bool) {
  return type(C).runtimeCode.length > 20;
}

contract D {
  function f() public returns (bool) {
    return test();
  }
}
// ====
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 21581
// gas LegacyOptimized: 21475
// gas Yul: 22401
// gas YulOptimized: 21609
