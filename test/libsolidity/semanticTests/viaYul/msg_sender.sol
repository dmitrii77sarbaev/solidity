contract C {
    function test() public view returns (bool) {
        address x;
        assembly { x := caller() }
        return x == msg.sender;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() -> true
// gas Legacy: 21414
// gas LegacyOptimized: 21276
// gas Yul: 22040
// gas YulOptimized: 21229
