contract C {
	// If these two functions are identical, the optimiser
	// on the old codegen path can deduplicate them, and breaking the test.
	function internal1() internal pure returns (bool) {
		return true;
	}
	function internal2() internal pure returns (bool) {
		return false;
	}

	function equal() public pure returns (bool same, bool diff, bool inv) {
		function() internal pure returns (bool) invalid;
		delete invalid;
		same = internal1 == internal1;
		diff = internal1 == internal2;
		inv  = internal1 == invalid;
	}

	function unequal() public pure returns (bool same, bool diff, bool inv) {
		function() internal pure returns (bool) invalid;
		delete invalid;
		same = internal1 != internal1;
		diff = internal1 != internal2;
		inv  = internal1 != invalid;
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// equal() -> true, false, false
// gas Legacy: 21689
// gas LegacyOptimized: 21381
// gas Yul: 22366
// gas YulOptimized: 21469
// unequal() -> false, true, true
// gas Legacy: 21720
// gas LegacyOptimized: 21412
// gas Yul: 22397
// gas YulOptimized: 21491
