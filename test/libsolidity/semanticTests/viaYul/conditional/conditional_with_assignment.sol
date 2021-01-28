contract A {
    function f() public pure returns (uint, uint, uint, uint) {
		uint y1 = 1;
		uint y2 = 1;
		uint x = 3 < 0 ? y1 = 3 : 6;
		uint z = 3 < 10 ? y2 = 5 : 6;
		return (x, y1, y2, z);
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 6, 1, 5, 5
// gas Legacy: 21839
// gas LegacyOptimized: 21351
// gas Yul: 22911
// gas YulOptimized: 21265
