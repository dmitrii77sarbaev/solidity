contract C {
	uint[] array;

	function f() public returns (uint) {
		uint y = array.push();
		return y;
	}

	function lv(uint value) public {
		array.push() = value;
	}

	function a(uint index) public view returns (uint) {
		return array[index];
	}

	function l() public view returns (uint) {
		return array.length;
	}

}
// ====
// compileViaYul: also
// ----
// l() -> 0
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// lv(uint256): 42 ->
// gas Legacy: 62512
// gas LegacyOptimized: 62258
// gas Yul: 65144
// gas YulOptimized: 64237
// l() -> 1
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// a(uint256): 0 -> 42
// gas Legacy: 23518
// gas LegacyOptimized: 23234
// gas Yul: 24205
// gas YulOptimized: 23462
// f() -> 0
// gas Legacy: 23880
// gas LegacyOptimized: 23700
// gas Yul: 25570
// gas YulOptimized: 24892
// l() -> 2
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// a(uint256): 1 -> 0
// gas Legacy: 23530
// gas LegacyOptimized: 23246
// gas Yul: 24217
// gas YulOptimized: 23474
// lv(uint256): 111 ->
// gas Legacy: 43312
// gas LegacyOptimized: 43058
// gas Yul: 45944
// gas YulOptimized: 45037
// l() -> 3
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// a(uint256): 2 -> 111
// gas Legacy: 23530
// gas LegacyOptimized: 23246
// gas Yul: 24217
// gas YulOptimized: 23474
