contract A {
	function f() public pure returns (uint) {
		uint x = true ? 1 : 0;
		uint y = false ? 0 : 1;
		return x + y;
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 21657
// gas LegacyOptimized: 21355
// gas Yul: 22429
// gas YulOptimized: 21229
