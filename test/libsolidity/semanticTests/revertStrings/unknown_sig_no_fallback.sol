contract A {
	receive () external payable {}
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// revertStrings: debug
// ----
// (): hex"00" -> FAILURE, hex"08c379a0", 0x20, 41, "Unknown signature and no fallbac", "k defined"
// gas Legacy: 21128
// gas LegacyOptimized: 21122
// gas Yul: 21168
// gas YulOptimized: 21107
