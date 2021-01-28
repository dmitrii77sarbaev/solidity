contract C {
	struct S {
		uint x;
	}

	S[] array;

	function f(uint y) public {
		S storage s = array.push();
		g(s, y);
	}

	function g(S storage s, uint y) internal {
		s.x = y;
	}

	function h(uint y) public {
		g(array.push(), y);
	}

	function lv(uint y) public {
		array.push().x = y;
	}

	function a(uint i) public returns (uint) {
		return array[i].x;
	}

	function l() public returns (uint) {
		return array.length;
	}

}
// ====
// compileViaYul: also
// ----
// l() -> 0
// gas Legacy: 22253
// gas LegacyOptimized: 22136
// gas Yul: 22671
// gas YulOptimized: 22309
// f(uint256): 42 ->
// gas Legacy: 62543
// gas LegacyOptimized: 62273
// gas Yul: 65124
// gas YulOptimized: 63356
// l() -> 1
// gas Legacy: 22253
// gas LegacyOptimized: 22136
// gas Yul: 22671
// gas YulOptimized: 22309
// a(uint256): 0 -> 42
// gas Legacy: 23546
// gas LegacyOptimized: 23259
// gas Yul: 24210
// gas YulOptimized: 23473
// h(uint256): 84 ->
// gas Legacy: 43374
// gas LegacyOptimized: 43115
// gas Yul: 45968
// gas YulOptimized: 44200
// l() -> 2
// gas Legacy: 22253
// gas LegacyOptimized: 22136
// gas Yul: 22671
// gas YulOptimized: 22309
// a(uint256): 1 -> 84
// gas Legacy: 23558
// gas LegacyOptimized: 23271
// gas Yul: 24222
// gas YulOptimized: 23485
// lv(uint256): 4096 ->
// gas Legacy: 43318
// gas LegacyOptimized: 43058
// gas Yul: 45867
// gas YulOptimized: 44178
// l() -> 3
// gas Legacy: 22253
// gas LegacyOptimized: 22136
// gas Yul: 22671
// gas YulOptimized: 22309
// a(uint256): 2 -> 4096
// gas Legacy: 23558
// gas LegacyOptimized: 23271
// gas Yul: 24222
// gas YulOptimized: 23485
