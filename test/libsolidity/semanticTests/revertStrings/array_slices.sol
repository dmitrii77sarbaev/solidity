contract C {
	function f(uint256 start, uint256 end, uint256[] calldata arr) external pure {
		arr[start:end];
	}
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// revertStrings: debug
// ----
// f(uint256,uint256,uint256[]): 2, 1, 0x80, 3, 1, 2, 3 -> FAILURE, hex"08c379a0", 0x20, 22, "Slice starts after end"
// gas Legacy: 22973
// gas LegacyOptimized: 22614
// gas Yul: 23012
// gas YulOptimized: 22623
// f(uint256,uint256,uint256[]): 1, 5, 0x80, 3, 1, 2, 3 -> FAILURE, hex"08c379a0", 0x20, 28, "Slice is greater than length"
// gas Legacy: 22999
// gas LegacyOptimized: 22634
// gas Yul: 23038
// gas YulOptimized: 22649
