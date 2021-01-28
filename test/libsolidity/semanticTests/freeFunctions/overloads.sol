function f(uint) returns (uint) {
    return 2;
}
function f(string memory) returns (uint) {
    return 3;
}

contract C {
  function g() public returns (uint, uint) {
      return (f(2), f("abc"));
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 2, 3
// gas Legacy: 21632
// gas LegacyOptimized: 21433
// gas Yul: 22894
// gas YulOptimized: 21516
