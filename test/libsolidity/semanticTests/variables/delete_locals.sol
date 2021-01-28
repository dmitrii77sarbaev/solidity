contract test {
    function delLocal() public returns (uint res1, uint res2){
        uint v = 5;
        uint w = 6;
        uint x = 7;
        delete v;
        res1 = w;
        res2 = x;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// delLocal() -> 6, 7
// gas Legacy: 21540
// gas LegacyOptimized: 21294
// gas Yul: 22171
// gas YulOptimized: 21241
