contract test {
    function run(bool x1, uint x2) public returns(uint y1, bool y2, uint y3) {
        y1 = x2; y2 = x1;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// run(bool,uint256): true, 0xcd -> 0xcd, true, 0
// gas Legacy: 22326
// gas LegacyOptimized: 21730
// gas Yul: 22691
// gas YulOptimized: 21584
