contract c {
    uint[20] spacer;
    uint[] dynamic;
    function fill() public {
        for (uint i = 0; i < 21; ++i)
            dynamic.push(i + 1);
    }
    function halfClear() public {
        while (dynamic.length > 5)
            dynamic.pop();
    }
    function fullClear() public { delete dynamic; }
}
// ====
// compileViaYul: also
// ----
// storage: empty// fill() ->
// gas Legacy: 504373
// gas LegacyOptimized: 499648
// gas Yul: 556824
// gas YulOptimized: 536238
// storage: nonempty// halfClear() ->
// gas Legacy: 75557
// gas LegacyOptimized: 75420
// gas Yul: 116943
// gas YulOptimized: 91197
// storage: nonempty// fullClear() ->
// gas Legacy: 27267
// gas LegacyOptimized: 27209
// gas Yul: 34404
// gas YulOptimized: 27436
// storage: empty