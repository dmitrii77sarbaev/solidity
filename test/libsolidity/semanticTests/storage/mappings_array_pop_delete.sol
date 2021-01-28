contract C {
	mapping (uint => uint)[] a;

	function n1(uint key, uint value) public {
		a.push();
		a[a.length - 1][key] = value;
	}

	function n2() public {
		a.push();
	}

	function map(uint key) public view returns (uint) {
		return a[a.length - 1][key];
	}

	function p() public {
		a.pop();
	}

	function d() public returns (uint) {
		delete a;
		return a.length;
	}
}
// ====
// compileViaYul: also
// ----
// n1(uint256,uint256): 42, 64 ->
// gas Legacy: 64761
// gas LegacyOptimized: 63438
// gas Yul: 67746
// gas YulOptimized: 64583
// map(uint256): 42 -> 64
// gas Legacy: 24626
// gas LegacyOptimized: 24208
// gas Yul: 25538
// gas YulOptimized: 24391
// p() ->
// gas Legacy: 22887
// gas LegacyOptimized: 22887
// gas Yul: 24445
// gas YulOptimized: 24056
// n2() ->
// gas Legacy: 22900
// gas LegacyOptimized: 22829
// gas Yul: 24424
// gas YulOptimized: 24007
// map(uint256): 42 -> 64
// gas Legacy: 24626
// gas LegacyOptimized: 24208
// gas Yul: 25538
// gas YulOptimized: 24391
// d() -> 0
// gas Legacy: 23978
// gas LegacyOptimized: 23860
// gas Yul: 23610
// gas YulOptimized: 22290
// n2() ->
// gas Legacy: 22900
// gas LegacyOptimized: 22829
// gas Yul: 24424
// gas YulOptimized: 24007
// map(uint256): 42 -> 64
// gas Legacy: 24626
// gas LegacyOptimized: 24208
// gas Yul: 25538
// gas YulOptimized: 24391
