contract C {
	function f() public pure returns (uint a, uint b) {
		assembly {
			let x
			let y, z
			a := x
			b := z
		}
	}
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0, 0
// gas Legacy: 21508
// gas LegacyOptimized: 21294
// gas Yul: 21884
// gas YulOptimized: 21241
