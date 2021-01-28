contract c {
    uint256[] data;

    function test() public returns (bool) {
        data.pop();
        return true;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() -> FAILURE, hex"4e487b71", 0x31
// gas Legacy: 22026
// gas LegacyOptimized: 22032
// gas Yul: 22266
// gas YulOptimized: 22054
