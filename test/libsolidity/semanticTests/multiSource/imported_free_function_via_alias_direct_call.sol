==== Source: s1.sol ====
function f() pure returns (uint) { return 1337; }
==== Source: s2.sol ====
import {f as g} from "s1.sol";
function f() pure returns (uint) { return 6; }
contract D {
  function h() public pure returns (uint) {
    return g() + f() * 10000;
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// h() -> 61337
// gas Legacy: 21853
// gas LegacyOptimized: 21497
// gas Yul: 22598
// gas YulOptimized: 21229
