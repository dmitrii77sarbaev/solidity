contract test {
    function run() public returns(int256 y) {
        return -int32(10) * -int64(20);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// run() -> 200
// gas Legacy: 22081
// gas LegacyOptimized: 21784
// gas Yul: 22842
// gas YulOptimized: 21229
