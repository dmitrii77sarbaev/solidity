contract C {
    function f(int a, int b) public pure returns (int x) {
        x = a - b;
    }
    function g(int8 a, int8 b) public pure returns (int8 x) {
        x = a - b;
    }
}
// ====
// compileViaYul: also
// ----
// f(int256,int256): 5, 6 -> -1
// gas Legacy: 22350
// gas LegacyOptimized: 21808
// gas Yul: 22675
// gas YulOptimized: 21857
// f(int256,int256): -2, 1 -> -3
// gas Legacy: 22722
// gas LegacyOptimized: 22180
// gas Yul: 23047
// gas YulOptimized: 22229
// f(int256,int256): -2, 2 -> -4
// gas Legacy: 22722
// gas LegacyOptimized: 22180
// gas Yul: 23047
// gas YulOptimized: 22229
// f(int256,int256): 2, -2 -> 4
// gas Legacy: 22722
// gas LegacyOptimized: 22180
// gas Yul: 23047
// gas YulOptimized: 22229
// f(int256,int256): 2, 2 -> 0
// gas Legacy: 22350
// gas LegacyOptimized: 21808
// gas Yul: 22675
// gas YulOptimized: 21857
// f(int256,int256): -5, -6 -> 1
// gas Legacy: 23094
// gas LegacyOptimized: 22552
// gas Yul: 23419
// gas YulOptimized: 22601
// f(int256,int256): 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0, -15 -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 23094
// gas LegacyOptimized: 22552
// gas Yul: 23419
// gas YulOptimized: 22601
// f(int256,int256): 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0, -16 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22896
// gas LegacyOptimized: 22478
// gas Yul: 22999
// gas YulOptimized: 22404
// f(int256,int256): 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, -1 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22896
// gas LegacyOptimized: 22478
// gas Yul: 22999
// gas YulOptimized: 22404
// f(int256,int256): 15, 0x8000000000000000000000000000000000000000000000000000000000000010 -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 22362
// gas LegacyOptimized: 21820
// gas Yul: 22687
// gas YulOptimized: 21869
// f(int256,int256): 16, 0x8000000000000000000000000000000000000000000000000000000000000010 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22164
// gas LegacyOptimized: 21746
// gas Yul: 22267
// gas YulOptimized: 21672
// f(int256,int256): 1, 0x8000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22152
// gas LegacyOptimized: 21734
// gas Yul: 22255
// gas YulOptimized: 21660
// f(int256,int256): -1, 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0x8000000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 23094
// gas LegacyOptimized: 22552
// gas Yul: 23419
// gas YulOptimized: 22601
// f(int256,int256): -2, 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22852
// gas LegacyOptimized: 22428
// gas Yul: 22943
// gas YulOptimized: 22354
// f(int256,int256): 0x8000000000000000000000000000000000000000000000000000000000000001, 1 -> 0x8000000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22362
// gas LegacyOptimized: 21820
// gas Yul: 22687
// gas YulOptimized: 21869
// f(int256,int256): 0x8000000000000000000000000000000000000000000000000000000000000001, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22120
// gas LegacyOptimized: 21696
// gas Yul: 22211
// gas YulOptimized: 21622
// f(int256,int256): 0x8000000000000000000000000000000000000000000000000000000000000000, 1 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22108
// gas LegacyOptimized: 21684
// gas Yul: 22199
// gas YulOptimized: 21610
// g(int8,int8): 5, 6 -> -1
// gas Legacy: 22412
// gas LegacyOptimized: 22007
// gas Yul: 22722
// gas YulOptimized: 22136
// g(int8,int8): -2, 1 -> -3
// gas Legacy: 22784
// gas LegacyOptimized: 22379
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): -2, 2 -> -4
// gas Legacy: 22784
// gas LegacyOptimized: 22379
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): 2, -2 -> 4
// gas Legacy: 22784
// gas LegacyOptimized: 22379
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): 2, 2 -> 0
// gas Legacy: 22412
// gas LegacyOptimized: 22007
// gas Yul: 22722
// gas YulOptimized: 22136
// g(int8,int8): -5, -6 -> 1
// gas Legacy: 23156
// gas LegacyOptimized: 22751
// gas Yul: 23466
// gas YulOptimized: 22880
// g(int8,int8): 126, -1 -> 127
// gas Legacy: 22784
// gas LegacyOptimized: 22379
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): 1, -126 -> 127
// gas Legacy: 22784
// gas LegacyOptimized: 22379
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): 127, -1 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22578
// gas LegacyOptimized: 22281
// gas Yul: 22666
// gas YulOptimized: 22292
// g(int8,int8): 1, -127 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22578
// gas LegacyOptimized: 22281
// gas Yul: 22666
// gas YulOptimized: 22292
// g(int8,int8): -127, 1 -> -128
// gas Legacy: 22784
// gas LegacyOptimized: 22379
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): -1, 127 -> -128
// gas Legacy: 22784
// gas LegacyOptimized: 22379
// gas Yul: 23094
// gas YulOptimized: 22508
// g(int8,int8): -127, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22534
// gas LegacyOptimized: 22243
// gas Yul: 22622
// gas YulOptimized: 22254
// g(int8,int8): -2, 127 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22534
// gas LegacyOptimized: 22243
// gas Yul: 22622
// gas YulOptimized: 22254
