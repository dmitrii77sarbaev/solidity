contract test {
    function fixedBytesHex() public returns(bytes32 ret) {
        return hex"aabb00ff";
    }
    function fixedBytes() public returns(bytes32 ret) {
        return "abc\x00\xff__";
    }
    function pipeThrough(bytes2 small, bool one) public returns(bytes16 large, bool oneRet) {
        oneRet = one;
        large = small;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// fixedBytesHex() -> "\xaa\xbb\x00\xff"
// gas Legacy: 21423
// gas LegacyOptimized: 21320
// gas Yul: 21847
// gas YulOptimized: 21487
// fixedBytes() -> "abc\x00\xff__"
// gas Legacy: 21401
// gas LegacyOptimized: 21298
// gas Yul: 21825
// gas YulOptimized: 21465
// pipeThrough(bytes2,bool): "\x00\x02", true -> "\x00\x02", true
// gas Legacy: 22244
// gas LegacyOptimized: 21799
// gas Yul: 22700
// gas YulOptimized: 21972
