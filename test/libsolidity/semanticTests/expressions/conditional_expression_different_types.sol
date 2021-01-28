contract test {
    function f(bool cond) public returns (uint) {
        uint8 x = 0xcd;
        uint16 y = 0xabab;
        return cond ? x : y;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> 0xcd
// gas Legacy: 21846
// gas LegacyOptimized: 21571
// gas Yul: 22527
// gas YulOptimized: 21646
// f(bool): false -> 0xabab
// gas Legacy: 21838
// gas LegacyOptimized: 21563
// gas Yul: 22411
// gas YulOptimized: 21624
