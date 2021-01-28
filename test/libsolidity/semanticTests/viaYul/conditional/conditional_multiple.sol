contract A {
	function f() public pure returns (uint) {
		uint x = 3 < 0 ? 2 > 1 ? 2 : 1 : 7 > 2 ? 7 : 6;
		return x;
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 7
// gas Legacy: 21456
// gas LegacyOptimized: 21270
// gas Yul: 22440
// gas YulOptimized: 21229
