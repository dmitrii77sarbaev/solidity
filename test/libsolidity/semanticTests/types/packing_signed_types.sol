contract test {
    function run() public returns(int8 y) {
        uint8 x = 0xfa;
        return int8(x);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// run() -> 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffa
// gas Legacy: 21400
// gas LegacyOptimized: 21284
// gas Yul: 21958
// gas YulOptimized: 21232
