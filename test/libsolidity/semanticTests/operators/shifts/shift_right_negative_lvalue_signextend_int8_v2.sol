pragma abicoder               v2;


contract C {
    function f(int8 a, uint8 b) public returns (int8) {
        return a >> b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(int8,uint8): 0x99, 0x00 -> FAILURE
// gas Legacy: 21653
// gas LegacyOptimized: 21533
// gas Yul: 21677
// gas YulOptimized: 21518
// f(int8,uint8): 0x99, 0x01 -> FAILURE
// gas Legacy: 21665
// gas LegacyOptimized: 21545
// gas Yul: 21689
// gas YulOptimized: 21530
// f(int8,uint8): 0x99, 0x02 -> FAILURE
// gas Legacy: 21665
// gas LegacyOptimized: 21545
// gas Yul: 21689
// gas YulOptimized: 21530
// f(int8,uint8): 0x99, 0x04 -> FAILURE
// gas Legacy: 21665
// gas LegacyOptimized: 21545
// gas Yul: 21689
// gas YulOptimized: 21530
// f(int8,uint8): 0x99, 0x08 -> FAILURE
// gas Legacy: 21665
// gas LegacyOptimized: 21545
// gas Yul: 21689
// gas YulOptimized: 21530
