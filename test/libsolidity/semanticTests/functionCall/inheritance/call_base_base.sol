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
		return f(n);
	}

	function h(uint n) public returns (uint) {
		return s(n);
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g(uint256): 4 -> 12
// gas Legacy: 22103
// gas LegacyOptimized: 21692
// gas Yul: 22536
// gas YulOptimized: 21813
// h(uint256): 4 -> 16
// gas Legacy: 22081
// gas LegacyOptimized: 21670
// gas Yul: 22514
// gas YulOptimized: 21791
