contract c {
    uint spacer1;
    uint spacer2;
    uint[20] data;
    function fill() public {
        for (uint i = 0; i < data.length; ++i) data[i] = i+1;
    }
    function clear() public { delete data; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// storage: empty// fill() ->
// gas Legacy: 429460
// gas LegacyOptimized: 425520
// gas Yul: 462405
// gas YulOptimized: 423997
// storage: nonempty// clear() ->
// gas Legacy: 38440
// gas LegacyOptimized: 38259
// gas Yul: 64292
// gas YulOptimized: 56498
// storage: empty