contract C {
    function f(uint8 x, uint8 y) public returns (uint) {
        return x**y;
    }
    function g(uint x, uint y) public returns (uint) {
        return x**y;
    }
}
// ====
// compileViaYul: also
// ----
// f(uint8,uint8): 2, 7 -> 0x80
// gas Legacy: 22569
// gas LegacyOptimized: 22079
// gas Yul: 22976
// gas YulOptimized: 22231
// f(uint8,uint8): 2, 8 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22339
// gas LegacyOptimized: 21962
// gas Yul: 22439
// gas YulOptimized: 21981
// f(uint8,uint8): 15, 2 -> 225
// gas Legacy: 22615
// gas LegacyOptimized: 22179
// gas Yul: 23022
// gas YulOptimized: 22334
// f(uint8,uint8): 6, 3 -> 0xd8
// gas Legacy: 22615
// gas LegacyOptimized: 22179
// gas Yul: 23022
// gas YulOptimized: 22334
// f(uint8,uint8): 7, 2 -> 0x31
// gas Legacy: 22615
// gas LegacyOptimized: 22179
// gas Yul: 23022
// gas YulOptimized: 22334
// f(uint8,uint8): 7, 3 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22387
// gas LegacyOptimized: 22064
// gas Yul: 22487
// gas YulOptimized: 22086
// f(uint8,uint8): 7, 4 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22387
// gas LegacyOptimized: 22064
// gas Yul: 22487
// gas YulOptimized: 22086
// f(uint8,uint8): 255, 31 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22387
// gas LegacyOptimized: 22064
// gas Yul: 22487
// gas YulOptimized: 22086
// f(uint8,uint8): 255, 131 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22400
// gas LegacyOptimized: 22065
// gas Yul: 22500
// gas YulOptimized: 22125
// g(uint256,uint256): 0x200000000000000000000000000000000, 1 -> 0x0200000000000000000000000000000000
// gas Legacy: 22618
// gas LegacyOptimized: 22052
// gas Yul: 22941
// gas YulOptimized: 22107
// g(uint256,uint256): 0x100000000000000000000000000000010, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22366
// gas LegacyOptimized: 21921
// gas Yul: 22466
// gas YulOptimized: 21876
// g(uint256,uint256): 0x200000000000000000000000000000000, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22354
// gas LegacyOptimized: 21909
// gas Yul: 22454
// gas YulOptimized: 21864
// g(uint256,uint256): 0x200000000000000000000000000000000, 3 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22354
// gas LegacyOptimized: 21909
// gas Yul: 22454
// gas YulOptimized: 21864
// g(uint256,uint256): 255, 31 -> 400631961586894742455537928461950192806830589109049416147172451019287109375
// gas Legacy: 22563
// gas LegacyOptimized: 22017
// gas Yul: 22885
// gas YulOptimized: 22019
// g(uint256,uint256): 255, 32 -> -13630939032658036097408813250890608687528184442832962921928608997994916749311
// gas Legacy: 23468
// gas LegacyOptimized: 22657
// gas Yul: 23801
// gas YulOptimized: 22887
// g(uint256,uint256): 255, 33 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23257
// gas LegacyOptimized: 22567
// gas Yul: 23368
// gas YulOptimized: 22700
// g(uint256,uint256): 255, 131 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23236
// gas LegacyOptimized: 22542
// gas Yul: 23346
// gas YulOptimized: 22676
// g(uint256,uint256): 258, 31 -> 575719427506838823084316385994930914701079543089399988096291424922125729792
// gas Legacy: 22575
// gas LegacyOptimized: 22029
// gas Yul: 22897
// gas YulOptimized: 22031
// g(uint256,uint256): 258, 37 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23078
// gas LegacyOptimized: 22433
// gas Yul: 23186
// gas YulOptimized: 22532
// g(uint256,uint256): 258, 131 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23078
// gas LegacyOptimized: 22433
// gas Yul: 23186
// gas YulOptimized: 22532
