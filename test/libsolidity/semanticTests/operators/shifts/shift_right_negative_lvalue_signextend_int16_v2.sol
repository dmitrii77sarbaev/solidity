pragma abicoder               v2;


contract C {
    function f(int16 a, uint16 b) public returns (int16) {
        return a >> b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(int16,uint16): 0xff99, 0x00 -> FAILURE
// gas Legacy: 21665
// gas LegacyOptimized: 21545
// gas Yul: 21689
// gas YulOptimized: 21530
// f(int16,uint16): 0xff99, 0x01 -> FAILURE
// gas Legacy: 21677
// gas LegacyOptimized: 21557
// gas Yul: 21701
// gas YulOptimized: 21542
// f(int16,uint16): 0xff99, 0x02 -> FAILURE
// gas Legacy: 21677
// gas LegacyOptimized: 21557
// gas Yul: 21701
// gas YulOptimized: 21542
// f(int16,uint16): 0xff99, 0x04 -> FAILURE
// gas Legacy: 21677
// gas LegacyOptimized: 21557
// gas Yul: 21701
// gas YulOptimized: 21542
// f(int16,uint16): 0xff99, 0x08 -> FAILURE
// gas Legacy: 21677
// gas LegacyOptimized: 21557
// gas Yul: 21701
// gas YulOptimized: 21542
