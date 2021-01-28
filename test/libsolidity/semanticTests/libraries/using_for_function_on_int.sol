library D {
	function double(uint self) public returns (uint) { return 2 * self; }
}
contract C {
	using D for uint;
	function f(uint a) public returns (uint) {
		return a.double();
	}
}
// ====
// compileViaYul: also
// ----
// library: D// f(uint256): 9 -> 18
// gas Legacy: 24557
// gas LegacyOptimized: 23596
// gas Yul: 25440
// gas YulOptimized: 23658
