contract Test {
    function bytesToUint(bytes32 s) public returns (uint256 h) {
        return uint(s);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// bytesToUint(bytes32): "abc2" -> left(0x61626332)
// gas Legacy: 21826
// gas LegacyOptimized: 21520
// gas Yul: 22301
// gas YulOptimized: 21405
