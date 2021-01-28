contract C {
	uint[] arr1;
	uint[][] arr2;
	function f() internal returns (uint[] storage ptr1, uint[][] storage ptr2) {
		ptr1 = arr1;
		ptr2 = arr2;
	}
	function g() public returns (uint, uint) {
		return (arr1.length, arr2.length);
	}

}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 0, 0
// gas Legacy: 23109
// gas LegacyOptimized: 22894
// gas Yul: 23582
// gas YulOptimized: 22851
