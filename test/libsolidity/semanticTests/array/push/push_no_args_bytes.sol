contract C {
	bytes array;

	function f() public {
		array.push();
	}

	function g(uint x) public {
		for (uint i = 0; i < x; ++i)
			array.push() = bytes1(uint8(i));
	}

	function l() public returns (uint) {
		return array.length;
	}

	function a(uint index) public view returns (bytes1) {
		return array[index];
	}
}
// ====
// compileViaYul: also
// ----
// l() -> 0
// gas Legacy: 22359
// gas LegacyOptimized: 22247
// gas Yul: 22789
// gas YulOptimized: 22416
// g(uint256): 70 ->
// gas Legacy: 419791
// gas LegacyOptimized: 415338
// gas Yul: 505028
// gas YulOptimized: 433788
// l() -> 70
// gas Legacy: 22345
// gas LegacyOptimized: 22233
// gas Yul: 22775
// gas YulOptimized: 22402
// a(uint256): 69 -> left(69)
// gas Legacy: 24524
// gas LegacyOptimized: 24256
// gas Yul: 24459
// gas YulOptimized: 23675
// f() ->
// gas Legacy: 24708
// gas LegacyOptimized: 23894
// gas Yul: 24726
// gas YulOptimized: 24381
// l() -> 71
// gas Legacy: 22345
// gas LegacyOptimized: 22233
// gas Yul: 22775
// gas YulOptimized: 22402
// a(uint256): 70 -> 0
// gas Legacy: 24524
// gas LegacyOptimized: 24256
// gas Yul: 24459
// gas YulOptimized: 23675
