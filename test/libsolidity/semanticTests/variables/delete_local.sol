contract test {
    function delLocal() public returns (uint res){
        uint v = 5;
        delete v;
        res = v;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// delLocal() -> 0
// gas Legacy: 21400
// gas LegacyOptimized: 21270
// gas Yul: 21861
// gas YulOptimized: 21229
