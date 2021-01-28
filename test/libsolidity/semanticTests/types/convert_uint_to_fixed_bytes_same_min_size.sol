contract Test {
    function UintToBytes(uint8 h) public returns (bytes1 s) {
        return bytes1(h);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// UintToBytes(uint8): 0x61 -> "a"
// gas Legacy: 21802
// gas LegacyOptimized: 21551
// gas Yul: 22245
// gas YulOptimized: 21615
