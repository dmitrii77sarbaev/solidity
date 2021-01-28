contract c {
    uint[] data;
    function test() public {
        data.push(7);
        data.pop();
    }
}
// ====
// compileViaYul: also
// ----
// test() ->
// gas Legacy: 64610
// gas LegacyOptimized: 64526
// gas Yul: 69680
// gas YulOptimized: 68341
// storage: empty