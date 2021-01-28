contract C {
	function f(uint x) public pure returns (uint) {
		return 2 * x;
	}
	function g() public view returns (function (uint) external returns (uint)) {
		return this.f;
	}
	function h(uint x) public returns (uint) {
		return this.g()(x) + 1;
	}
	function t() external view returns (
			function(uint) external returns (uint) a,
			function(uint) external view returns (uint) b) {
		a = this.f;
		b = this.f;
	}
}
// ====
// compileViaYul: also
// ----
// f(uint256): 2 -> 4
// gas Legacy: 22016
// gas LegacyOptimized: 21608
// gas Yul: 22404
// gas YulOptimized: 21750
// h(uint256): 2 -> 5
// gas Legacy: 27433
// gas LegacyOptimized: 25820
// gas Yul: 29439
// gas YulOptimized: 26563
// t() -> 0xFDD67305928FCAC8D213D1E47BFA6165CD0B87BB3DE648B0000000000000000, 0xFDD67305928FCAC8D213D1E47BFA6165CD0B87BB3DE648B0000000000000000
// gas Legacy: 21781
// gas LegacyOptimized: 21450
// gas Yul: 22699
// gas YulOptimized: 21713
