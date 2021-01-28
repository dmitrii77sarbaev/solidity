contract C {
	function f(string memory s) public pure returns (bytes memory t) {
		t = bytes(s);
	}
}
// ====
// compileViaYul: also
// ----
// f(string): 32, 5, "Hello" -> 32, 5, "Hello"
// gas Legacy: 23017
// gas LegacyOptimized: 22357
// gas Yul: 23365
// gas YulOptimized: 22460
