contract A {
	function f(bool cond) public pure returns (uint, uint) {
		(uint a, uint b) = cond ? (1, 2) : (3, 4);
		return (a, b);
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> 1, 2
// gas Legacy: 21957
// gas LegacyOptimized: 21606
// gas Yul: 22721
// gas YulOptimized: 21686
// f(bool): false -> 3, 4
// gas Legacy: 21955
// gas LegacyOptimized: 21604
// gas Yul: 22699
// gas YulOptimized: 21664
