==== Source: s1.sol ====
function f() pure returns (uint) { return 1337; }
contract C {
  function g() public pure returns (uint) {
    return f();
  }
}
==== Source: s2.sol ====
import "s1.sol";
contract D is C {
  function h() public pure returns (uint) {
    return g();
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// h() -> 1337
// gas Legacy: 21449
// gas LegacyOptimized: 21325
// gas Yul: 22009
// gas YulOptimized: 21344
