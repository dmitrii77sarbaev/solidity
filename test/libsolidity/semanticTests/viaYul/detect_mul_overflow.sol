contract C {
    function f(uint a, uint b) public pure returns (uint x) {
        x = a * b;
    }
    function g(uint8 a, uint8 b) public pure returns (uint8 x) {
        x = a * b;
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256,uint256): 5, 6 -> 30
// gas Legacy: 22307
// gas LegacyOptimized: 21751
// gas Yul: 22617
// gas YulOptimized: 21800
// f(uint256,uint256): -1, 1 -> -1
// gas Legacy: 22679
// gas LegacyOptimized: 22123
// gas Yul: 22989
// gas YulOptimized: 22172
// f(uint256,uint256): -1, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22479
// gas LegacyOptimized: 22049
// gas Yul: 22567
// gas YulOptimized: 21975
// f(uint256,uint256): 0x8000000000000000000000000000000000000000000000000000000000000000, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22107
// gas LegacyOptimized: 21677
// gas Yul: 22195
// gas YulOptimized: 21603
// f(uint256,uint256): 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 2 -> -2
// gas Legacy: 22679
// gas LegacyOptimized: 22123
// gas Yul: 22989
// gas YulOptimized: 22172
// f(uint256,uint256): 2, 0x8000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22107
// gas LegacyOptimized: 21677
// gas Yul: 22195
// gas YulOptimized: 21603
// f(uint256,uint256): 2, 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> -2
// gas Legacy: 22679
// gas LegacyOptimized: 22123
// gas Yul: 22989
// gas YulOptimized: 22172
// f(uint256,uint256): 0x0100000000000000000000000000000000, 0x0100000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22107
// gas LegacyOptimized: 21677
// gas Yul: 22195
// gas YulOptimized: 21603
// f(uint256,uint256): 0x0100000000000000000000000000000000, 0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
// gas Legacy: 22487
// gas LegacyOptimized: 21931
// gas Yul: 22797
// gas YulOptimized: 21980
// f(uint256,uint256): 0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0x0100000000000000000000000000000000 -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
// gas Legacy: 22487
// gas LegacyOptimized: 21931
// gas Yul: 22797
// gas YulOptimized: 21980
// f(uint256,uint256): 0x0100000000000000000000000000000001, 0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> -1
// gas Legacy: 22499
// gas LegacyOptimized: 21943
// gas Yul: 22809
// gas YulOptimized: 21992
// f(uint256,uint256): 0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0x0100000000000000000000000000000001 -> -1
// gas Legacy: 22499
// gas LegacyOptimized: 21943
// gas Yul: 22809
// gas YulOptimized: 21992
// f(uint256,uint256): 0x0100000000000000000000000000000002, 0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22299
// gas LegacyOptimized: 21869
// gas Yul: 22387
// gas YulOptimized: 21795
// f(uint256,uint256): 0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0x0100000000000000000000000000000002 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22299
// gas LegacyOptimized: 21869
// gas Yul: 22387
// gas YulOptimized: 21795
// f(uint256,uint256): -1, 0 -> 0
// gas Legacy: 22667
// gas LegacyOptimized: 22111
// gas Yul: 22977
// gas YulOptimized: 22160
// f(uint256,uint256): 0, -1 -> 0
// gas Legacy: 22667
// gas LegacyOptimized: 22111
// gas Yul: 22977
// gas YulOptimized: 22160
// g(uint8,uint8): 5, 6 -> 30
// gas Legacy: 22359
// gas LegacyOptimized: 21943
// gas Yul: 22666
// gas YulOptimized: 22081
// g(uint8,uint8): 0x80, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22153
// gas LegacyOptimized: 21850
// gas Yul: 22238
// gas YulOptimized: 21867
// g(uint8,uint8): 0x7F, 2 -> 254
// gas Legacy: 22359
// gas LegacyOptimized: 21943
// gas Yul: 22666
// gas YulOptimized: 22081
// g(uint8,uint8): 2, 0x7F -> 254
// gas Legacy: 22359
// gas LegacyOptimized: 21943
// gas Yul: 22666
// gas YulOptimized: 22081
// g(uint8,uint8): 0x10, 0x10 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22153
// gas LegacyOptimized: 21850
// gas Yul: 22238
// gas YulOptimized: 21867
// g(uint8,uint8): 0x0F, 0x11 -> 0xFF
// gas Legacy: 22359
// gas LegacyOptimized: 21943
// gas Yul: 22666
// gas YulOptimized: 22081
// g(uint8,uint8): 0x0F, 0x12 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22153
// gas LegacyOptimized: 21850
// gas Yul: 22238
// gas YulOptimized: 21867
// g(uint8,uint8): 0x12, 0x0F -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22153
// gas LegacyOptimized: 21850
// gas Yul: 22238
// gas YulOptimized: 21867
// g(uint8,uint8): 0xFF, 0 -> 0
// gas Legacy: 22347
// gas LegacyOptimized: 21931
// gas Yul: 22654
// gas YulOptimized: 22069
// g(uint8,uint8): 0, 0xFF -> 0
// gas Legacy: 22347
// gas LegacyOptimized: 21931
// gas Yul: 22654
// gas YulOptimized: 22069
