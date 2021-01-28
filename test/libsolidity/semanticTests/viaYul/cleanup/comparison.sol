contract C {
	function eq() public pure returns (bool) {
		uint8 x = 1; uint8 y;
		assembly { y := 0x0101 }
		return (x == y);
	}
	function neq() public pure returns (bool) {
		uint8 x = 1; uint8 y;
		assembly { y := 0x0101 }
		return (x != y);
	}
	function geq() public pure returns (bool) {
		uint8 x = 1; uint8 y;
		assembly { y := 0x0101 }
		return (x >= y);
	}
	function leq() public pure returns (bool) {
		uint8 x = 2; uint8 y;
		assembly { y := 0x0101 }
		return (x <= y);
	}
	function gt() public pure returns (bool) {
		uint8 x = 2; uint8 y;
		assembly { y := 0x0101 }
		return (x > y);
	}
	function lt() public pure returns (bool) {
		uint8 x = 1; uint8 y;
		assembly { y := 0x0101 }
		return (x < y);
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// eq() -> true
// gas Legacy: 21517
// gas LegacyOptimized: 21364
// gas Yul: 22117
// gas YulOptimized: 21534
// neq() -> false
// gas Legacy: 21454
// gas LegacyOptimized: 21298
// gas Yul: 22054
// gas YulOptimized: 21468
// geq() -> true
// gas Legacy: 21432
// gas LegacyOptimized: 21276
// gas Yul: 22032
// gas YulOptimized: 21446
// leq() -> false
// gas Legacy: 21542
// gas LegacyOptimized: 21386
// gas Yul: 22142
// gas YulOptimized: 21556
// gt() -> true
// gas Legacy: 21495
// gas LegacyOptimized: 21342
// gas Yul: 22095
// gas YulOptimized: 21512
// lt() -> false
// gas Legacy: 21473
// gas LegacyOptimized: 21320
// gas Yul: 22073
// gas YulOptimized: 21490
