contract Test {
    function bytesToBytes(bytes4 input) public returns (bytes4 ret) {
        return bytes4(input);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// bytesToBytes(bytes4): "abcd" -> "abcd"
// gas Legacy: 21832
// gas LegacyOptimized: 21596
// gas Yul: 22143
// gas YulOptimized: 21459
