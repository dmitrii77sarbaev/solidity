contract Base {
	function f(uint n) public returns (uint) {
		return 2 * n;
	}
}

contract Child is Base {
	function g(uint n) public returns (uint) {
		return Base.f(n);
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g(uint256): 4 -> 8
// gas Legacy: 22059
// gas LegacyOptimized: 21648
// gas Yul: 22492
// gas YulOptimized: 21725
