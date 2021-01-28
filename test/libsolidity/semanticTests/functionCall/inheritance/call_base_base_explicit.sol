contract BaseBase {
	function f(uint n) public virtual returns (uint) {
		return 2 * n;
	}

	function s(uint n) public returns (uint) {
		return 4 * n;
	}
}

contract Base is BaseBase {
	function f(uint n) public virtual override returns (uint) {
		return 3 * n;
	}
}

contract Child is Base {
	function g(uint n) public returns (uint) {
		// calling base-bse function of a virtual overridden function.
		return BaseBase.f(n);
	}

	function k(uint n) public returns (uint) {
		// Calling base-base function of a non-virtual function.
		return BaseBase.s(n);
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g(uint256): 4 -> 8
// gas Legacy: 22103
// gas LegacyOptimized: 21680
// gas Yul: 22536
// gas YulOptimized: 21813
// k(uint256): 4 -> 16
// gas Legacy: 22037
// gas LegacyOptimized: 21626
// gas Yul: 22470
// gas YulOptimized: 21747
