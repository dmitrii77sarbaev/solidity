pragma abicoder               v2;


contract C {
    function f(int8 a, uint8 b) public returns (int256) {
        assembly {
            a := 0xfffffff0
        }
        // Higher bits should be signextended before the shift
        return a >> b;
    }

    function g(int8 a, uint8 b) public returns (int256) {
        assembly {
            a := 0xf0
        }
        // Higher bits should be signextended before the shift
        return a >> b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(int8,uint8): 0x00, 0x03 -> 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe
// gas Legacy: 22138
// gas LegacyOptimized: 21745
// gas Yul: 22779
// gas YulOptimized: 21807
// f(int8,uint8): 0x00, 0x04 -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22138
// gas LegacyOptimized: 21745
// gas Yul: 22779
// gas YulOptimized: 21807
// f(int8,uint8): 0x00, 0xff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22138
// gas LegacyOptimized: 21745
// gas Yul: 22779
// gas YulOptimized: 21807
// f(int8,uint8): 0x00, 0x1003 -> FAILURE
// gas Legacy: 21836
// gas LegacyOptimized: 21591
// gas Yul: 21865
// gas YulOptimized: 21609
// f(int8,uint8): 0x00, 0x1004 -> FAILURE
// gas Legacy: 21836
// gas LegacyOptimized: 21591
// gas Yul: 21865
// gas YulOptimized: 21609
// g(int8,uint8): 0x00, 0x03 -> 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe
// gas Legacy: 22160
// gas LegacyOptimized: 21767
// gas Yul: 22801
// gas YulOptimized: 21888
// g(int8,uint8): 0x00, 0x04 -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22160
// gas LegacyOptimized: 21767
// gas Yul: 22801
// gas YulOptimized: 21888
// g(int8,uint8): 0x00, 0xff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22160
// gas LegacyOptimized: 21767
// gas Yul: 22801
// gas YulOptimized: 21888
// g(int8,uint8): 0x00, 0x1003 -> FAILURE
// gas Legacy: 21858
// gas LegacyOptimized: 21613
// gas Yul: 21887
// gas YulOptimized: 21631
// g(int8,uint8): 0x00, 0x1004 -> FAILURE
// gas Legacy: 21858
// gas LegacyOptimized: 21613
// gas Yul: 21887
// gas YulOptimized: 21631
