==== Source: A ====
contract A {
	function g(uint256 x) public view returns(uint256) { return x + 1; }
}
==== Source: B ====
import "A";
contract B is A {
	function f(uint256 x) public view returns(uint256) { return x; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 1337 -> 1337
// gas Legacy: 21796
// gas LegacyOptimized: 21496
// gas Yul: 22096
// gas YulOptimized: 21548
// g(uint256): 1337 -> 1338
// gas Legacy: 22012
// gas LegacyOptimized: 21598
// gas Yul: 22400
// gas YulOptimized: 21666
