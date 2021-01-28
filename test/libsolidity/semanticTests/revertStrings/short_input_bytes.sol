pragma abicoder               v2;
contract C {
	function e(bytes memory a) public pure returns (uint) { return 7; }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// revertStrings: debug
// ----
// e(bytes): 0x20, 7 -> FAILURE, hex"08c379a0", 0x20, 39, "ABI decoding: invalid byte array", " length"
// gas Legacy: 22176
// gas LegacyOptimized: 21826
// gas Yul: 22205
// gas YulOptimized: 21874
