contract BaseBase {
	uint public x;
	uint public y;
	function init(uint a, uint b) public virtual {
		x = b;
		y = a;
	}
	function init(uint a) public virtual {
		x = a + 1;
	}
}

contract Base is BaseBase {
	function init(uint a, uint b) public override {
		x = a;
		y = b;
	}
	function init(uint a) public override {
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
	function bInit(uint c) public {
		BaseBase.init(c);
	}
	function bInit(uint c, uint d) public {
		BaseBase.init(c, d);
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// x() -> 0
// gas Legacy: 22194
// gas LegacyOptimized: 22093
// gas Yul: 22722
// gas YulOptimized: 22243
// y() -> 0
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22810
// gas YulOptimized: 22331
// cInit(uint256): 2 ->
// gas Legacy: 41720
// gas LegacyOptimized: 41524
// gas Yul: 43131
// gas YulOptimized: 41620
// x() -> 2
// gas Legacy: 22194
// gas LegacyOptimized: 22093
// gas Yul: 22722
// gas YulOptimized: 22243
// y() -> 0
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22810
// gas YulOptimized: 22331
// cInit(uint256,uint256): 3, 3 ->
// gas Legacy: 42808
// gas LegacyOptimized: 42460
// gas Yul: 45332
// gas YulOptimized: 42557
// x() -> 3
// gas Legacy: 22194
// gas LegacyOptimized: 22093
// gas Yul: 22722
// gas YulOptimized: 22243
// y() -> 3
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22810
// gas YulOptimized: 22331
// bInit(uint256): 4 ->
// gas Legacy: 22713
// gas LegacyOptimized: 22395
// gas Yul: 24301
// gas YulOptimized: 22543
// x() -> 5
// gas Legacy: 22194
// gas LegacyOptimized: 22093
// gas Yul: 22722
// gas YulOptimized: 22243
// bInit(uint256,uint256): 9, 10 ->
// gas Legacy: 23630
// gas LegacyOptimized: 23273
// gas Yul: 26154
// gas YulOptimized: 23379
// x() -> 10
// gas Legacy: 22194
// gas LegacyOptimized: 22093
// gas Yul: 22722
// gas YulOptimized: 22243
// y() -> 9
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22810
// gas YulOptimized: 22331
