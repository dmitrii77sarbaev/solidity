contract C {
	function() internal view returns(uint256) immutable z;
	constructor() {
		z = f;
	}
	function f() public view returns (uint256) {
		return 7;
	}
	function callZ() public view returns (uint) {
		return z();
	}
}
// ====
// compileViaYul: also
// ----
// f() -> 7
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21849
// gas YulOptimized: 21405
// callZ() -> 7
// gas Legacy: 21442
// gas LegacyOptimized: 21333
// gas Yul: 22024
// gas YulOptimized: 21535
