contract C {
    function f(int a, int b) public pure returns (int x) {
        x = a * b;
    }
    function g(int8 a, int8 b) public pure returns (int8 x) {
        x = a * b;
    }
}
// ====
// compileViaYul: also
// ----
// f(int256,int256): 5, 6 -> 30
// gas Legacy: 22493
// gas LegacyOptimized: 21973
// gas Yul: 22836
// gas YulOptimized: 22010
// f(int256,int256): -1, 1 -> -1
// gas Legacy: 22865
// gas LegacyOptimized: 22345
// gas Yul: 23208
// gas YulOptimized: 22382
// f(int256,int256): -1, 2 -> -2 # positive, positive #
// gas Legacy: 22865
// gas LegacyOptimized: 22345
// gas Yul: 23208
// gas YulOptimized: 22382
// f(int256,int256): 0x3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 2 -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
// gas Legacy: 22865
// gas LegacyOptimized: 22345
// gas Yul: 23208
// gas YulOptimized: 22382
// f(int256,int256): 0x4000000000000000000000000000000000000000000000000000000000000000, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22119
// gas LegacyOptimized: 21707
// gas Yul: 22216
// gas YulOptimized: 21633
// f(int256,int256): 2, 0x3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
// gas Legacy: 22865
// gas LegacyOptimized: 22345
// gas Yul: 23208
// gas YulOptimized: 22382
// f(int256,int256): 2, 0x4000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11 # positive, negative #
// gas Legacy: 22119
// gas LegacyOptimized: 21707
// gas Yul: 22216
// gas YulOptimized: 21633
// f(int256,int256): 2, 0x4000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11 # positive, negative #
// gas Legacy: 22119
// gas LegacyOptimized: 21707
// gas Yul: 22216
// gas YulOptimized: 21633
// f(int256,int256): 2, 0x4000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11 # positive, negative #
// gas Legacy: 22119
// gas LegacyOptimized: 21707
// gas Yul: 22216
// gas YulOptimized: 21633
// f(int256,int256): 0x4000000000000000000000000000000000000000000000000000000000000000, -2 -> 0x8000000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22865
// gas LegacyOptimized: 22345
// gas Yul: 23208
// gas YulOptimized: 22382
// f(int256,int256): 0x4000000000000000000000000000000000000000000000000000000000000001, -2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22561
// gas LegacyOptimized: 22155
// gas Yul: 22664
// gas YulOptimized: 22081
// f(int256,int256): 2, 0xC000000000000000000000000000000000000000000000000000000000000000 -> 0x8000000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22493
// gas LegacyOptimized: 21973
// gas Yul: 22836
// gas YulOptimized: 22010
// f(int256,int256): 2, 0xBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> FAILURE, hex"4e487b71", 0x11 # negative, positive #
// gas Legacy: 22549
// gas LegacyOptimized: 22143
// gas Yul: 22652
// gas YulOptimized: 22069
// f(int256,int256): 2, 0xBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> FAILURE, hex"4e487b71", 0x11 # negative, positive #
// gas Legacy: 22549
// gas LegacyOptimized: 22143
// gas Yul: 22652
// gas YulOptimized: 22069
// f(int256,int256): 2, 0xBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> FAILURE, hex"4e487b71", 0x11 # negative, positive #
// gas Legacy: 22549
// gas LegacyOptimized: 22143
// gas Yul: 22652
// gas YulOptimized: 22069
// f(int256,int256): -2, 0x4000000000000000000000000000000000000000000000000000000000000000 -> 0x8000000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22865
// gas LegacyOptimized: 22345
// gas Yul: 23208
// gas YulOptimized: 22382
// f(int256,int256): -2, 0x4000000000000000000000000000000000000000000000000000000000000001 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22619
// gas LegacyOptimized: 22215
// gas Yul: 22728
// gas YulOptimized: 22141
// f(int256,int256): 0xC000000000000000000000000000000000000000000000000000000000000000, 2 -> 0x8000000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22493
// gas LegacyOptimized: 21973
// gas Yul: 22836
// gas YulOptimized: 22010
// f(int256,int256): 0xBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 2 -> FAILURE, hex"4e487b71", 0x11 # negative, negative #
// gas Legacy: 22607
// gas LegacyOptimized: 22203
// gas Yul: 22716
// gas YulOptimized: 22129
// f(int256,int256): 0xBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 2 -> FAILURE, hex"4e487b71", 0x11 # negative, negative #
// gas Legacy: 22607
// gas LegacyOptimized: 22203
// gas Yul: 22716
// gas YulOptimized: 22129
// f(int256,int256): 0xBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 2 -> FAILURE, hex"4e487b71", 0x11 # negative, negative #
// gas Legacy: 22607
// gas LegacyOptimized: 22203
// gas Yul: 22716
// gas YulOptimized: 22129
// f(int256,int256): 0xC000000000000000000000000000000000000000000000000000000000000001, -2 -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
// gas Legacy: 22877
// gas LegacyOptimized: 22357
// gas Yul: 23220
// gas YulOptimized: 22394
// f(int256,int256): 0xC000000000000000000000000000000000000000000000000000000000000000, -2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22665
// gas LegacyOptimized: 22249
// gas Yul: 22786
// gas YulOptimized: 22177
// f(int256,int256): -2, 0xC000000000000000000000000000000000000000000000000000000000000001 -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
// gas Legacy: 22877
// gas LegacyOptimized: 22357
// gas Yul: 23220
// gas YulOptimized: 22394
// f(int256,int256): -2, 0xC000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11 # small type #
// gas Legacy: 22665
// gas LegacyOptimized: 22249
// gas Yul: 22786
// gas YulOptimized: 22177
// f(int256,int256): -2, 0xC000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11 # small type #
// gas Legacy: 22665
// gas LegacyOptimized: 22249
// gas Yul: 22786
// gas YulOptimized: 22177
// f(int256,int256): -2, 0xC000000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x11 # small type #
// gas Legacy: 22665
// gas LegacyOptimized: 22249
// gas Yul: 22786
// gas YulOptimized: 22177
// g(int8,int8): 5, 6 -> 30
// gas Legacy: 22555
// gas LegacyOptimized: 22155
// gas Yul: 22868
// gas YulOptimized: 22284
// g(int8,int8): -1, 1 -> -1
// gas Legacy: 22927
// gas LegacyOptimized: 22527
// gas Yul: 23240
// gas YulOptimized: 22656
// g(int8,int8): -1, 2 -> -2 # positive, positive #
// gas Legacy: 22927
// gas LegacyOptimized: 22527
// gas Yul: 23240
// gas YulOptimized: 22656
// g(int8,int8): 63, 2 -> 126
// gas Legacy: 22555
// gas LegacyOptimized: 22155
// gas Yul: 22868
// gas YulOptimized: 22284
// g(int8,int8): 64, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22173
// gas LegacyOptimized: 21882
// gas Yul: 22258
// gas YulOptimized: 21893
// g(int8,int8): 2, 63 -> 126
// gas Legacy: 22555
// gas LegacyOptimized: 22155
// gas Yul: 22868
// gas YulOptimized: 22284
// g(int8,int8): 2, 64 -> FAILURE, hex"4e487b71", 0x11 # positive, negative #
// gas Legacy: 22173
// gas LegacyOptimized: 21882
// gas Yul: 22258
// gas YulOptimized: 21893
// g(int8,int8): 2, 64 -> FAILURE, hex"4e487b71", 0x11 # positive, negative #
// gas Legacy: 22173
// gas LegacyOptimized: 21882
// gas Yul: 22258
// gas YulOptimized: 21893
// g(int8,int8): 2, 64 -> FAILURE, hex"4e487b71", 0x11 # positive, negative #
// gas Legacy: 22173
// gas LegacyOptimized: 21882
// gas Yul: 22258
// gas YulOptimized: 21893
// g(int8,int8): 64, -2 -> -128
// gas Legacy: 22927
// gas LegacyOptimized: 22527
// gas Yul: 23240
// gas YulOptimized: 22656
// g(int8,int8): 65, -2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22603
// gas LegacyOptimized: 22315
// gas Yul: 22691
// gas YulOptimized: 22326
// g(int8,int8): 2, -64 -> -128
// gas Legacy: 22927
// gas LegacyOptimized: 22527
// gas Yul: 23240
// gas YulOptimized: 22656
// g(int8,int8): 2, -65 -> FAILURE, hex"4e487b71", 0x11 # negative, positive #
// gas Legacy: 22603
// gas LegacyOptimized: 22315
// gas Yul: 22691
// gas YulOptimized: 22326
// g(int8,int8): 2, -65 -> FAILURE, hex"4e487b71", 0x11 # negative, positive #
// gas Legacy: 22603
// gas LegacyOptimized: 22315
// gas Yul: 22691
// gas YulOptimized: 22326
// g(int8,int8): 2, -65 -> FAILURE, hex"4e487b71", 0x11 # negative, positive #
// gas Legacy: 22603
// gas LegacyOptimized: 22315
// gas Yul: 22691
// gas YulOptimized: 22326
// g(int8,int8): -2, 64 -> -128
// gas Legacy: 22927
// gas LegacyOptimized: 22527
// gas Yul: 23240
// gas YulOptimized: 22656
// g(int8,int8): -2, 65 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22661
// gas LegacyOptimized: 22375
// gas Yul: 22752
// gas YulOptimized: 22386
// g(int8,int8): -64, 2 -> -128
// gas Legacy: 22927
// gas LegacyOptimized: 22527
// gas Yul: 23240
// gas YulOptimized: 22656
// g(int8,int8): -65, 2 -> FAILURE, hex"4e487b71", 0x11 # negative, negative #
// gas Legacy: 22661
// gas LegacyOptimized: 22375
// gas Yul: 22752
// gas YulOptimized: 22386
// g(int8,int8): -65, 2 -> FAILURE, hex"4e487b71", 0x11 # negative, negative #
// gas Legacy: 22661
// gas LegacyOptimized: 22375
// gas Yul: 22752
// gas YulOptimized: 22386
// g(int8,int8): -65, 2 -> FAILURE, hex"4e487b71", 0x11 # negative, negative #
// gas Legacy: 22661
// gas LegacyOptimized: 22375
// gas Yul: 22752
// gas YulOptimized: 22386
// g(int8,int8): -63, -2 -> 126
// gas Legacy: 23299
// gas LegacyOptimized: 22899
// gas Yul: 23612
// gas YulOptimized: 23028
// g(int8,int8): -64, -2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23091
// gas LegacyOptimized: 22793
// gas Yul: 23182
// gas YulOptimized: 22806
// g(int8,int8): -2, -63 -> 126
// gas Legacy: 23299
// gas LegacyOptimized: 22899
// gas Yul: 23612
// gas YulOptimized: 23028
// g(int8,int8): -2, -64 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23091
// gas LegacyOptimized: 22793
// gas Yul: 23182
// gas YulOptimized: 22806
