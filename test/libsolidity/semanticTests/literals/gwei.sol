contract C {
	uint constant x = 1 gwei;

	function f() public view returns(uint) { return x; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1000000000
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21884
// gas YulOptimized: 21229
