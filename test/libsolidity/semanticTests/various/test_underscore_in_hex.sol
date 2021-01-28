contract test {
    function f(bool cond) public pure returns (uint256) {
        uint32 x = 0x1234_ab;
        uint256 y = 0x1234_abcd_1234;
        return cond ? x : y;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> 0x1234ab
// gas Legacy: 21840
// gas LegacyOptimized: 21565
// gas Yul: 22427
// gas YulOptimized: 21640
// f(bool): false -> 0x1234abcd1234
// gas Legacy: 21832
// gas LegacyOptimized: 21557
// gas Yul: 22311
// gas YulOptimized: 21618
