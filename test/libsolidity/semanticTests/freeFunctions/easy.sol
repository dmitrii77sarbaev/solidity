function add(uint a, uint b) pure returns (uint) {
  return a + b;
}

contract C {
  function f(uint x) public pure returns (uint) {
    return add(x, 2);
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 7 -> 9
// gas Legacy: 22026
// gas LegacyOptimized: 21609
// gas Yul: 22458
// gas YulOptimized: 21585
