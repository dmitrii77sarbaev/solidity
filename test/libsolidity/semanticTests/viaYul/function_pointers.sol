contract C {
	function f() public {
		function() internal returns (uint) _f;
		_f();
	}
	function g() public {
		function() external returns (uint) _g;
		_g();
	}
	function h1() internal returns (function() internal returns (uint) _h) {}
	function h2() public {
		h1()();
	}
	function k1() internal returns (function() external returns (uint) _k) {}
	function k2() public {
		k1()();
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 21225
// gas LegacyOptimized: 21231
// gas Yul: 21406
// gas YulOptimized: 21277
// g() -> FAILURE
// gas Legacy: 22052
// gas LegacyOptimized: 22052
// gas Yul: 22157
// gas YulOptimized: 22044
// h2() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 21271
// gas LegacyOptimized: 21277
// gas Yul: 21453
// gas YulOptimized: 21299
// k2() -> FAILURE
// gas Legacy: 22051
// gas LegacyOptimized: 22051
// gas Yul: 22170
// gas YulOptimized: 22022
