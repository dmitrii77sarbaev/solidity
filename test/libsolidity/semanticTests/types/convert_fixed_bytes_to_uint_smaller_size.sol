contract Test {
    function bytesToUint(bytes4 s) public returns (uint16 h) {
        return uint16(uint32(s));
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// bytesToUint(bytes4): "abcd" -> 0x6364
// gas Legacy: 21838
// gas LegacyOptimized: 21587
// gas Yul: 22419
// gas YulOptimized: 21534
