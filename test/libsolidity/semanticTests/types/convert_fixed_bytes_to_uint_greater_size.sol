contract Test {
    function bytesToUint(bytes4 s) public returns (uint64 h) {
        return uint64(uint32(s));
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// bytesToUint(bytes4): "abcd" -> 0x61626364
// gas Legacy: 21844
// gas LegacyOptimized: 21587
// gas Yul: 22419
// gas YulOptimized: 21460
