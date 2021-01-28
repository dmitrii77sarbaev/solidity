pragma abicoder               v2;


contract C {
    function f(uint8 a, uint8 b) public returns (uint256) {
        assembly {
            a := 0xffffffff
        }
        // Higher bits should be cleared before the shift
        return a >> b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint8,uint8): 0x00, 0x04 -> 0x0f
// gas Legacy: 22132
// gas LegacyOptimized: 21800
// gas Yul: 22770
// gas YulOptimized: 21818
// f(uint8,uint8): 0x00, 0x1004 -> FAILURE
// gas Legacy: 21834
// gas LegacyOptimized: 21642
// gas Yul: 21862
// gas YulOptimized: 21603
