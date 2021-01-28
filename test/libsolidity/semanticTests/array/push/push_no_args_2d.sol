contract C {
	uint[][] array2d;

	function l() public returns (uint) {
		return array2d.length;
	}

	function ll(uint index) public returns (uint) {
		return array2d[index].length;
	}

	function a(uint i, uint j) public returns (uint) {
		return array2d[i][j];
	}

	function f(uint index, uint value) public {
		uint[] storage pointer = array2d.push();
		for (uint i = 0; i <= index; ++i)
			pointer.push();
		pointer[index] = value;
	}

	function lv(uint value) public {
		array2d.push().push() = value;
	}
}
// ====
// compileViaYul: also
// ----
// l() -> 0
// gas Legacy: 22275
// gas LegacyOptimized: 22158
// gas Yul: 22693
// gas YulOptimized: 22331
// f(uint256,uint256): 42, 64 ->
// gas Legacy: 163034
// gas LegacyOptimized: 157045
// gas Yul: 219085
// gas YulOptimized: 200008
// l() -> 1
// gas Legacy: 22275
// gas LegacyOptimized: 22158
// gas Yul: 22693
// gas YulOptimized: 22331
// ll(uint256): 0 -> 43
// gas Legacy: 23482
// gas LegacyOptimized: 23193
// gas Yul: 24000
// gas YulOptimized: 23407
// a(uint256,uint256): 0, 42 -> 64
// gas Legacy: 24689
// gas LegacyOptimized: 24257
// gas Yul: 25568
// gas YulOptimized: 24577
// f(uint256,uint256): 84, 128 ->
// gas Legacy: 222080
// gas LegacyOptimized: 210631
// gas Yul: 329875
// gas YulOptimized: 293494
// l() -> 2
// gas Legacy: 22275
// gas LegacyOptimized: 22158
// gas Yul: 22693
// gas YulOptimized: 22331
// ll(uint256): 1 -> 85
// gas Legacy: 23494
// gas LegacyOptimized: 23205
// gas Yul: 24012
// gas YulOptimized: 23419
// a(uint256,uint256): 0, 42 -> 64
// gas Legacy: 24689
// gas LegacyOptimized: 24257
// gas Yul: 25568
// gas YulOptimized: 24577
// a(uint256,uint256): 1, 84 -> 128
// gas Legacy: 24701
// gas LegacyOptimized: 24269
// gas Yul: 25580
// gas YulOptimized: 24589
// lv(uint256): 512 ->
// gas Legacy: 64244
// gas LegacyOptimized: 63971
// gas Yul: 67992
// gas YulOptimized: 66931
// a(uint256,uint256): 2, 0 -> 512
// gas Legacy: 24689
// gas LegacyOptimized: 24257
// gas Yul: 25568
// gas YulOptimized: 24577
