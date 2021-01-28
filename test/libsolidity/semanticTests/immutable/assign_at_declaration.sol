contract A {
	uint8 immutable a = 2;
	function f() public view returns (uint) {
		return a;
	}
}
// ====
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 21385
// gas LegacyOptimized: 21276
// gas Yul: 21854
// gas YulOptimized: 21235
