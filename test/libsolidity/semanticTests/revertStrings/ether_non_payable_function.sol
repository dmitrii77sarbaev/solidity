contract C {
	function f() public {}
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// revertStrings: debug
// ----
// f(), 1 ether -> FAILURE, hex"08c379a0", 0x20, 34, "Ether sent to non-payable functi", "on"
// gas Legacy: 21193
// gas LegacyOptimized: 21187
// gas Yul: 21301
// gas YulOptimized: 21224
// () -> FAILURE, hex"08c379a0", 0x20, 53, "Contract does not have fallback ", "nor receive functions"
// gas Legacy: 21154
// gas LegacyOptimized: 21148
// gas Yul: 21149
// gas YulOptimized: 21109
