contract Test {
    function uintToBytes(uint256 h) public returns (bytes32 s) {
        return bytes32(h);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// uintToBytes(uint256): left(0x616263) -> left(0x616263)
// gas Legacy: 21814
// gas LegacyOptimized: 21508
// gas Yul: 22245
// gas YulOptimized: 21393
