contract Test {
	function() internal x;
	function f() public returns (bool) {
		function() internal t = x;
		// The legacy codegen  would use a specific function
		// entry tag that always panics.
		// Via Yul, the internal dispatch will panic instead.
		uint z;
		assembly { z := t }
		assert(z == 0);
		return true;
	}
}
// ====
// compileViaYul: true
// ----
// f() -> true
// gas Yul: 23007
// gas YulOptimized: 22242
