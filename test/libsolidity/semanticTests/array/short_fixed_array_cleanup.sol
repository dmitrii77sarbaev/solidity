contract c {
    uint spacer1;
    uint spacer2;
    uint[3] data;
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
// gas Legacy: 82473
// gas LegacyOptimized: 81882
// gas Yul: 87980
// gas YulOptimized: 81821
// storage: nonempty// clear() ->
// gas Legacy: 23654
// gas LegacyOptimized: 23648
// gas Yul: 28201
// gas YulOptimized: 26629
// storage: empty