contract c {
    bytes data;
    function test() public {
        data.push(0x07);
        data.push(0x05);
        data.push(0x03);
        data.pop();
        data.pop();
        data.pop();
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() ->
// gas Legacy: 59367
// gas LegacyOptimized: 59247
// gas Yul: 53661
// gas YulOptimized: 52122
// storage: empty