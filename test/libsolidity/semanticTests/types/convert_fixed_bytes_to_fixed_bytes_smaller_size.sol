contract Test {
    function bytesToBytes(bytes4 input) public returns (bytes2 ret) {
        return bytes2(input);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// bytesToBytes(bytes4): "abcd" -> "ab"
// gas Legacy: 21832
// gas LegacyOptimized: 21596
// gas Yul: 22243
// gas YulOptimized: 21466
