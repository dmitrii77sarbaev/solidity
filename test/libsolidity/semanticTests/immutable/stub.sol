contract C {
	uint256 immutable x;
	uint256 immutable y;
	constructor() {
		x = 42;
		y = 23;
	}
	function f() public view returns (uint256, uint256) {
		return (x+x,y);
	}
}
// ====
// compileViaYul: also
// ----
// f() -> 84, 23
// gas Legacy: 21687
// gas LegacyOptimized: 21374
// gas Yul: 22078
// gas YulOptimized: 21465
