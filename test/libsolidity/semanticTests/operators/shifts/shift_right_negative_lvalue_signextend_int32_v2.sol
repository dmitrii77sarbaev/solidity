pragma abicoder               v2;


contract C {
    function f(int32 a, uint32 b) public returns (int32) {
        return a >> b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(int32,uint32): 0xffffff99, 0x00 -> FAILURE
// gas Legacy: 21689
// gas LegacyOptimized: 21569
// gas Yul: 21713
// gas YulOptimized: 21554
// f(int32,uint32): 0xffffff99, 0x01 -> FAILURE
// gas Legacy: 21701
// gas LegacyOptimized: 21581
// gas Yul: 21725
// gas YulOptimized: 21566
// f(int32,uint32): 0xffffff99, 0x02 -> FAILURE
// gas Legacy: 21701
// gas LegacyOptimized: 21581
// gas Yul: 21725
// gas YulOptimized: 21566
// f(int32,uint32): 0xffffff99, 0x04 -> FAILURE
// gas Legacy: 21701
// gas LegacyOptimized: 21581
// gas Yul: 21725
// gas YulOptimized: 21566
// f(int32,uint32): 0xffffff99, 0x08 -> FAILURE
// gas Legacy: 21701
// gas LegacyOptimized: 21581
// gas Yul: 21725
// gas YulOptimized: 21566
