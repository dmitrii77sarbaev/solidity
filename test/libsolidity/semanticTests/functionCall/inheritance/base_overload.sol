contract Base {
	uint public x;
	uint public y;
	function init(uint a, uint b) public {
		x = a;
		y = b;
	}
	function init(uint a) public {
		x = a;
	}
}

contract Child is Base {
	function cInit(uint c) public {
		Base.init(c);
	}
	function cInit(uint c, uint d) public {
		Base.init(c, d);
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// x() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22243
// y() -> 0
// gas Legacy: 22237
// gas LegacyOptimized: 22136
// gas Yul: 22788
// gas YulOptimized: 22309
// cInit(uint256): 2 ->
// gas Legacy: 41675
// gas LegacyOptimized: 41479
// gas Yul: 43109
// gas YulOptimized: 41598
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22243
// y() -> 0
// gas Legacy: 22237
// gas LegacyOptimized: 22136
// gas Yul: 22788
// gas YulOptimized: 22309
// cInit(uint256,uint256): 3, 3 ->
// gas Legacy: 42785
// gas LegacyOptimized: 42437
// gas Yul: 45332
// gas YulOptimized: 42557
// x() -> 3
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22243
// y() -> 3
// gas Legacy: 22237
// gas LegacyOptimized: 22136
// gas Yul: 22788
// gas YulOptimized: 22309
