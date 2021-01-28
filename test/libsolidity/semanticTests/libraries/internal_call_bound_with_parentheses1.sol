library L {
	function f() internal returns (uint) {
		return 3;
	}
}

contract C {
	function foo() public returns (uint) {
		return (L.f)();
	}
}

// ====
// compileViaYul: also
// ----
// foo() -> 3
// gas Legacy: 21414
// gas LegacyOptimized: 21305
// gas Yul: 22001
// gas YulOptimized: 21229
