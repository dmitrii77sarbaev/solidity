==== Source: s1.sol ====
function f() pure returns (uint) { return 1337; }
contract C {
  function g() public pure virtual returns (uint) {
    return f();
  }
}
==== Source: s2.sol ====
import "s1.sol";
contract D is C {
  function g() public pure override returns (uint) {
    return super.g();
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 1337
// gas Legacy: 21449
// gas LegacyOptimized: 21325
// gas Yul: 22008
// gas YulOptimized: 21229
