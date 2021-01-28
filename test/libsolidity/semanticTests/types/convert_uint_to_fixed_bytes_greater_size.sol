contract Test {
    function UintToBytes(uint16 h) public returns (bytes8 s) {
        return bytes8(uint64(h));
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// UintToBytes(uint16): 0x6162 -> "\x00\x00\x00\x00\x00\x00ab"
// gas Legacy: 21820
// gas LegacyOptimized: 21575
// gas Yul: 22351
// gas YulOptimized: 21627
