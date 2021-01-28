contract C {
	function f(bool a) public pure returns (bool x) {
		bool b = a;
		x = b;
		require(b);
	}
	function fail() public pure returns (bool x) {
		x = true;
		require(false);
	}
	function succeed() public pure returns (bool x) {
		x = true;
		require(true);
	}
	function f2(bool a) public pure returns (bool x) {
		x = a;
		string memory message;
		message = "fancy message!";
		require(a, message);
	}
	function f3(bool a) public pure returns (bool x) {
		x = a;
		require(a, "msg");
	}
	function f4(bool a) public pure returns (bool x) {
		x = a;
		string memory message;
		require(a, message);
	}
}
// ====
// EVMVersion: >=byzantium
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> true
// gas Legacy: 21848
// gas LegacyOptimized: 21576
// gas Yul: 22171
// gas YulOptimized: 21721
// f(bool): false -> FAILURE
// gas Legacy: 21637
// gas LegacyOptimized: 21466
// gas Yul: 21723
// gas YulOptimized: 21491
// fail() -> FAILURE
// gas Legacy: 21276
// gas LegacyOptimized: 21252
// gas Yul: 21455
// gas YulOptimized: 21333
// succeed() -> true
// gas Legacy: 21490
// gas LegacyOptimized: 21376
// gas Yul: 21908
// gas YulOptimized: 21534
// f2(bool): true -> true
// gas Legacy: 21931
// gas LegacyOptimized: 21666
// gas Yul: 22815
// gas YulOptimized: 21947
// f2(bool): false -> FAILURE, hex"08c379a0", 0x20, 14, "fancy message!"
// gas Legacy: 22279
// gas LegacyOptimized: 21877
// gas Yul: 22964
// gas YulOptimized: 21970
// f3(bool): true -> true
// gas Legacy: 21813
// gas LegacyOptimized: 21549
// gas Yul: 22149
// gas YulOptimized: 21699
// f3(bool): false -> FAILURE, hex"08c379a0", 0x20, 3, "msg"
// gas Legacy: 21897
// gas LegacyOptimized: 21579
// gas Yul: 22031
// gas YulOptimized: 21550
// f4(bool): true -> true
// gas Legacy: 21936
// gas LegacyOptimized: 21669
// gas Yul: 22313
// gas YulOptimized: 21858
// f4(bool): false -> FAILURE, hex"08c379a0", 0x20, 0
// gas Legacy: 22191
// gas LegacyOptimized: 21777
// gas Yul: 22368
// gas YulOptimized: 21771
