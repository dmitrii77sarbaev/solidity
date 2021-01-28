contract C {
    function f(int a, int b) public pure returns (int x) {
        x = a + b;
    }
    function g(int8 a, int8 b) public pure returns (int8 x) {
        x = a + b;
    }
}
// ====
// compileViaYul: also
// ----
// f(int256,int256): 5, 6 -> 11
// gas Legacy: 22350
// gas LegacyOptimized: 21814
// gas Yul: 22675
// gas YulOptimized: 21857
// f(int256,int256): -2, 1 -> -1
// gas Legacy: 22722
// gas LegacyOptimized: 22186
// gas Yul: 23047
// gas YulOptimized: 22229
// f(int256,int256): -2, 2 -> 0
// gas Legacy: 22722
// gas LegacyOptimized: 22186
// gas Yul: 23047
// gas YulOptimized: 22229
// f(int256,int256): 2, -2 -> 0
// gas Legacy: 22722
// gas LegacyOptimized: 22186
// gas Yul: 23047
// gas YulOptimized: 22229
// f(int256,int256): -5, -6 -> -11
// gas Legacy: 23094
// gas LegacyOptimized: 22558
// gas Yul: 23419
// gas YulOptimized: 22601
// f(int256,int256): 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0, 0x0F -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 22722
// gas LegacyOptimized: 22186
// gas Yul: 23047
// gas YulOptimized: 22229
// f(int256,int256): 0x0F, 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0 -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 22722
// gas LegacyOptimized: 22186
// gas Yul: 23047
// gas YulOptimized: 22229
// f(int256,int256): 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 1 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22480
// gas LegacyOptimized: 22065
// gas Yul: 22577
// gas YulOptimized: 21988
// f(int256,int256): 1, 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22480
// gas LegacyOptimized: 22065
// gas Yul: 22577
// gas YulOptimized: 21988
// f(int256,int256): 0x8000000000000000000000000000000000000000000000000000000000000001, -1 -> 0x8000000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22734
// gas LegacyOptimized: 22198
// gas Yul: 23059
// gas YulOptimized: 22241
// f(int256,int256): -1, 0x8000000000000000000000000000000000000000000000000000000000000001 -> 0x8000000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22734
// gas LegacyOptimized: 22198
// gas Yul: 23059
// gas YulOptimized: 22241
// f(int256,int256): 0x8000000000000000000000000000000000000000000000000000000000000000, -1 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22524
// gas LegacyOptimized: 22112
// gas Yul: 22627
// gas YulOptimized: 22032
// f(int256,int256): -1, 0x8000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22524
// gas LegacyOptimized: 22112
// gas Yul: 22627
// gas YulOptimized: 22032
// g(int8,int8): 5, 6 -> 11
// gas Legacy: 22412
// gas LegacyOptimized: 22004
// gas Yul: 22722
// gas YulOptimized: 22136
// g(int8,int8): -2, 1 -> -1
// gas Legacy: 22784
// gas LegacyOptimized: 22376
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): -2, 2 -> 0
// gas Legacy: 22784
// gas LegacyOptimized: 22376
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): 2, -2 -> 0
// gas Legacy: 22784
// gas LegacyOptimized: 22376
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): -5, -6 -> -11
// gas Legacy: 23156
// gas LegacyOptimized: 22748
// gas Yul: 23466
// gas YulOptimized: 22880
// g(int8,int8): 126, 1 -> 127
// gas Legacy: 22412
// gas LegacyOptimized: 22004
// gas Yul: 22722
// gas YulOptimized: 22136
// g(int8,int8): 1, 126 -> 127
// gas Legacy: 22412
// gas LegacyOptimized: 22004
// gas Yul: 22722
// gas YulOptimized: 22136
// g(int8,int8): 127, 1 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22162
// gas LegacyOptimized: 21868
// gas Yul: 22247
// gas YulOptimized: 21879
// g(int8,int8): 1, 127 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22162
// gas LegacyOptimized: 21868
// gas Yul: 22247
// gas YulOptimized: 21879
// g(int8,int8): -127, -1 -> -128
// gas Legacy: 23156
// gas LegacyOptimized: 22748
// gas Yul: 23466
// gas YulOptimized: 22880
// g(int8,int8): -1, -127 -> -128
// gas Legacy: 23156
// gas LegacyOptimized: 22748
// gas Yul: 23466
// gas YulOptimized: 22880
// g(int8,int8): -127, -2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22950
// gas LegacyOptimized: 22653
// gas Yul: 23038
// gas YulOptimized: 22664
// g(int8,int8): -2, -127 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22950
// gas LegacyOptimized: 22653
// gas Yul: 23038
// gas YulOptimized: 22664
// g(int8,int8): -128, 0 -> -128
// gas Legacy: 22772
// gas LegacyOptimized: 22364
// gas Yul: 23082
// gas YulOptimized: 22496
// g(int8,int8): 0, -128 -> -128
// gas Legacy: 22772
// gas LegacyOptimized: 22364
// gas Yul: 23082
// gas YulOptimized: 22496
