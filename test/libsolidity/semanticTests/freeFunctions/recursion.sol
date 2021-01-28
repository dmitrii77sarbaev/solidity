function exp(uint base, uint exponent) pure returns (uint power) {
    if (exponent == 0)
        return 1;
    power = exp(base, exponent / 2);
    power *= power;
    if (exponent & 1 == 1)
        power *= base;
}

contract C {
  function g(uint base, uint exponent) public pure returns (uint) {
      return exp(base, exponent);
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g(uint256,uint256): 0, 0 -> 1
// gas Legacy: 22158
// gas LegacyOptimized: 21715
// gas Yul: 22731
// gas YulOptimized: 21669
// g(uint256,uint256): 0, 1 -> 0x00
// gas Legacy: 22894
// gas LegacyOptimized: 22075
// gas Yul: 23985
// gas YulOptimized: 22018
// g(uint256,uint256): 1, 0 -> 1
// gas Legacy: 22170
// gas LegacyOptimized: 21727
// gas Yul: 22743
// gas YulOptimized: 21681
// g(uint256,uint256): 2, 3 -> 8
// gas Legacy: 23630
// gas LegacyOptimized: 22435
// gas Yul: 25239
// gas YulOptimized: 22367
// g(uint256,uint256): 3, 10 -> 59049
// gas Legacy: 24642
// gas LegacyOptimized: 22937
// gas Yul: 27261
// gas YulOptimized: 22813
// g(uint256,uint256): 2, 255 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 27974
// gas LegacyOptimized: 24523
// gas Yul: 32691
// gas YulOptimized: 24389
