pragma abicoder v2;
contract C {
    function t(uint) public pure {}
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// revertStrings: debug
// ----
// t(uint256) -> FAILURE, hex"08c379a0", 0x20, 34, "ABI decoding: tuple data too sho", "rt"
// gas Legacy: 21330
// gas LegacyOptimized: 21288
// gas Yul: 21356
// gas YulOptimized: 21279
