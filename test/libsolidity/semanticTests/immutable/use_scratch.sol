contract C {
	uint256 immutable x;
	uint256 immutable y;
	mapping(uint => uint) public m;
	constructor(uint _a) {
		x = 42;
		y = 23;
		m[_a] = 7;
		new uint[](4);

	}
	function f() public view returns (uint256, uint256) {
		return (x+x,y);
	}
}
// ====
// compileViaYul: also
// ----
// constructor(): 3 ->
// gas Legacy: 225639
// gas LegacyOptimized: 162279
// gas Yul: 287339
// gas YulOptimized: 170188
// f() -> 84, 23
// gas Legacy: 21687
// gas LegacyOptimized: 21374
// gas Yul: 22079
// gas YulOptimized: 21466
// m(uint256): 3 -> 7
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
