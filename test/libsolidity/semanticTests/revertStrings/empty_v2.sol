pragma abicoder               v2;
contract C {
	function f() public {
		revert("");
	}
	function g(string calldata msg) public {
		revert(msg);
	}
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// revertStrings: debug
// ----
// f() -> FAILURE, hex"08c379a0", 0x20, 0
// gas Legacy: 21458
// gas LegacyOptimized: 21297
// gas Yul: 21576
// gas YulOptimized: 21319
// g(string): "" -> FAILURE, hex"08c379a0", 0x20, 0
// gas Legacy: 22058
// gas LegacyOptimized: 21791
// gas Yul: 22128
// gas YulOptimized: 21752
// g(string): 0x20, 0, "" -> FAILURE, hex"08c379a0", 0x20, 0
// gas Legacy: 22326
// gas LegacyOptimized: 22059
// gas Yul: 22396
// gas YulOptimized: 22020
// g(string): 0x20, 0 -> FAILURE, hex"08c379a0", 0x20, 0
// gas Legacy: 22198
// gas LegacyOptimized: 21931
// gas Yul: 22268
// gas YulOptimized: 21892
