contract C {
	mapping (uint => uint)[][] a;

	function n1(uint key, uint value) public {
		a.push();
		mapping (uint => uint)[] storage b = a[a.length - 1];
		b.push();
		b[b.length - 1][key] = value;
	}

	function n2() public {
		a.push();
		mapping (uint => uint)[] storage b = a[a.length - 1];
		b.push();
	}

	function map(uint key) public view returns (uint) {
		mapping (uint => uint)[] storage b = a[a.length - 1];
		return b[b.length - 1][key];
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
// gas Legacy: 87542
// gas LegacyOptimized: 85234
// gas Yul: 91983
// gas YulOptimized: 86459
// map(uint256): 42 -> 64
// gas Legacy: 26515
// gas LegacyOptimized: 25982
// gas Yul: 27771
// gas YulOptimized: 26189
// p() ->
// gas Legacy: 24691
// gas LegacyOptimized: 24691
// gas Yul: 25406
// gas YulOptimized: 24005
// n2() ->
// gas Legacy: 26481
// gas LegacyOptimized: 25411
// gas Yul: 29456
// gas YulOptimized: 25871
// map(uint256): 42 -> 64
// gas Legacy: 26515
// gas LegacyOptimized: 25982
// gas Yul: 27771
// gas YulOptimized: 26189
// d() -> 0
// gas Legacy: 25800
// gas LegacyOptimized: 25675
// gas Yul: 25831
// gas YulOptimized: 24917
// n2() ->
// gas Legacy: 26481
// gas LegacyOptimized: 25411
// gas Yul: 29456
// gas YulOptimized: 25871
// map(uint256): 42 -> 64
// gas Legacy: 26515
// gas LegacyOptimized: 25982
// gas Yul: 27771
// gas YulOptimized: 26189
