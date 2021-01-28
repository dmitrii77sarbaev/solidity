contract C {
	function add() public pure returns (uint8, uint8) {
		uint8 x; uint8 y = 0;
		assembly { x := 0x0101 }
		return (x + y, y + x);
	}
	function sub() public pure returns (uint8, uint8) {
		uint8 x; uint8 y = 1;
		assembly { x := 0x0101 }
		return (x - y, y - x);
	}
	function mul() public pure returns (uint8, uint8) {
		uint8 x; uint8 y = 1;
		assembly { x := 0x0101 }
		return (x * y, y * x);
	}
	function div() public pure returns (uint8, uint8) {
		uint8 x; uint8 y = 1;
		assembly { x := 0x0101 }
		return (x / y, y / x);
	}
	function mod() public pure returns (uint8, uint8) {
		uint8 x; uint8 y = 2;
		assembly { x := 0x0101 }
		return (x % y, y % x);
	}
	function inc_pre() public pure returns (uint8) {
		uint8 x;
		assembly { x := 0x0100 }
		return ++x;
	}
	function inc_post() public pure returns (uint8) {
		uint8 x;
		assembly { x := 0x0100 }
		return x++;
	}
	function dec_pre() public pure returns (uint8) {
		uint8 x;
		assembly { x := not(0xFF) }
		return --x;
	}
	function dec_post() public pure returns (uint8) {
		uint8 x;
		assembly { x := not(0xFF) }
		return x--;
	}
	function neg() public pure returns (int8) {
		int8 x;
		assembly { x := 0x80 }
		return -x;
	}
}
// ====
// compileToEwasm: also
// compileViaYul: true
// ----
// add() -> 1, 1
// gas Yul: 22477
// gas YulOptimized: 21519
// sub() -> 0, 0
// gas Yul: 22575
// gas YulOptimized: 21629
// mul() -> 1, 1
// gas Yul: 22531
// gas YulOptimized: 21862
// div() -> 1, 1
// gas Yul: 22617
// gas YulOptimized: 21673
// mod() -> 1, 0
// gas Yul: 22441
// gas YulOptimized: 21497
// inc_pre() -> 1
// gas Yul: 22111
// gas YulOptimized: 21712
// inc_post() -> 0
// gas Yul: 21935
// gas YulOptimized: 21446
// dec_pre() -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21638
// gas YulOptimized: 21467
// dec_post() -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21619
// gas YulOptimized: 21408
// neg() -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21596
// gas YulOptimized: 21428
