contract Test {
    function bytesToBytes(bytes2 input) public returns (bytes4 ret) {
        return bytes4(input);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// bytesToBytes(bytes2): "ab" -> "ab"
// gas Legacy: 21817
// gas LegacyOptimized: 21593
// gas Yul: 22219
// gas YulOptimized: 21435
