contract Test {
    function bytesToUint(bytes1 s) public returns (uint8 h) {
        return uint8(s);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// bytesToUint(bytes1): "a" -> 0x61
// gas Legacy: 21802
// gas LegacyOptimized: 21551
// gas Yul: 22289
// gas YulOptimized: 21424
