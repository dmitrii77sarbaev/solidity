contract C {
    function f(uint8 x, uint8 y) public returns (uint) {
        return x**y;
    }
    function g(uint x, uint y) public returns (uint) {
        return x**y;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint8,uint8): 0, 0 -> 1
// gas Legacy: 22362
// gas LegacyOptimized: 21926
// gas Yul: 22763
// gas YulOptimized: 22075
// f(uint8,uint8): 0, 1 -> 0x00
// gas Legacy: 22391
// gas LegacyOptimized: 21955
// gas Yul: 22798
// gas YulOptimized: 22110
// f(uint8,uint8): 0, 2 -> 0x00
// gas Legacy: 22391
// gas LegacyOptimized: 21955
// gas Yul: 22798
// gas YulOptimized: 22110
// f(uint8,uint8): 0, 3 -> 0x00
// gas Legacy: 22391
// gas LegacyOptimized: 21955
// gas Yul: 22798
// gas YulOptimized: 22110
// f(uint8,uint8): 1, 0 -> 1
// gas Legacy: 22374
// gas LegacyOptimized: 21938
// gas Yul: 22775
// gas YulOptimized: 22087
// f(uint8,uint8): 1, 1 -> 1
// gas Legacy: 22432
// gas LegacyOptimized: 21999
// gas Yul: 22839
// gas YulOptimized: 22151
// f(uint8,uint8): 1, 2 -> 1
// gas Legacy: 22432
// gas LegacyOptimized: 21999
// gas Yul: 22839
// gas YulOptimized: 22151
// f(uint8,uint8): 1, 3 -> 1
// gas Legacy: 22432
// gas LegacyOptimized: 21999
// gas Yul: 22839
// gas YulOptimized: 22151
// f(uint8,uint8): 2, 0 -> 1
// gas Legacy: 22374
// gas LegacyOptimized: 21938
// gas Yul: 22775
// gas YulOptimized: 22087
// f(uint8,uint8): 2, 1 -> 2
// gas Legacy: 22569
// gas LegacyOptimized: 22079
// gas Yul: 22976
// gas YulOptimized: 22231
// f(uint8,uint8): 2, 2 -> 4
// gas Legacy: 22569
// gas LegacyOptimized: 22079
// gas Yul: 22976
// gas YulOptimized: 22231
// f(uint8,uint8): 2, 3 -> 8
// gas Legacy: 22569
// gas LegacyOptimized: 22079
// gas Yul: 22976
// gas YulOptimized: 22231
// f(uint8,uint8): 3, 0 -> 1
// gas Legacy: 22374
// gas LegacyOptimized: 21938
// gas Yul: 22775
// gas YulOptimized: 22087
// f(uint8,uint8): 3, 1 -> 3
// gas Legacy: 22615
// gas LegacyOptimized: 22179
// gas Yul: 23022
// gas YulOptimized: 22334
// f(uint8,uint8): 3, 2 -> 9
// gas Legacy: 22615
// gas LegacyOptimized: 22179
// gas Yul: 23022
// gas YulOptimized: 22334
// f(uint8,uint8): 3, 3 -> 0x1b
// gas Legacy: 22615
// gas LegacyOptimized: 22179
// gas Yul: 23022
// gas YulOptimized: 22334
// f(uint8,uint8): 10, 0 -> 1
// gas Legacy: 22374
// gas LegacyOptimized: 21938
// gas Yul: 22775
// gas YulOptimized: 22087
// f(uint8,uint8): 10, 1 -> 0x0a
// gas Legacy: 22615
// gas LegacyOptimized: 22179
// gas Yul: 23022
// gas YulOptimized: 22334
// f(uint8,uint8): 10, 2 -> 100
// gas Legacy: 22615
// gas LegacyOptimized: 22179
// gas Yul: 23022
// gas YulOptimized: 22334
// g(uint256,uint256): 0, 0 -> 1
// gas Legacy: 22310
// gas LegacyOptimized: 21764
// gas Yul: 22626
// gas YulOptimized: 21760
// g(uint256,uint256): 0, 1 -> 0x00
// gas Legacy: 22339
// gas LegacyOptimized: 21793
// gas Yul: 22661
// gas YulOptimized: 21795
// g(uint256,uint256): 0, 2 -> 0x00
// gas Legacy: 22339
// gas LegacyOptimized: 21793
// gas Yul: 22661
// gas YulOptimized: 21795
// g(uint256,uint256): 0, 3 -> 0x00
// gas Legacy: 22339
// gas LegacyOptimized: 21793
// gas Yul: 22661
// gas YulOptimized: 21795
// g(uint256,uint256): 1, 0 -> 1
// gas Legacy: 22322
// gas LegacyOptimized: 21776
// gas Yul: 22638
// gas YulOptimized: 21772
// g(uint256,uint256): 1, 1 -> 1
// gas Legacy: 22380
// gas LegacyOptimized: 21837
// gas Yul: 22702
// gas YulOptimized: 21836
// g(uint256,uint256): 1, 2 -> 1
// gas Legacy: 22380
// gas LegacyOptimized: 21837
// gas Yul: 22702
// gas YulOptimized: 21836
// g(uint256,uint256): 1, 3 -> 1
// gas Legacy: 22380
// gas LegacyOptimized: 21837
// gas Yul: 22702
// gas YulOptimized: 21836
// g(uint256,uint256): 2, 0 -> 1
// gas Legacy: 22322
// gas LegacyOptimized: 21776
// gas Yul: 22638
// gas YulOptimized: 21772
// g(uint256,uint256): 2, 1 -> 2
// gas Legacy: 22517
// gas LegacyOptimized: 21917
// gas Yul: 22839
// gas YulOptimized: 21916
// g(uint256,uint256): 2, 2 -> 4
// gas Legacy: 22517
// gas LegacyOptimized: 21917
// gas Yul: 22839
// gas YulOptimized: 21916
// g(uint256,uint256): 2, 3 -> 8
// gas Legacy: 22517
// gas LegacyOptimized: 21917
// gas Yul: 22839
// gas YulOptimized: 21916
// g(uint256,uint256): 3, 0 -> 1
// gas Legacy: 22322
// gas LegacyOptimized: 21776
// gas Yul: 22638
// gas YulOptimized: 21772
// g(uint256,uint256): 3, 1 -> 3
// gas Legacy: 22563
// gas LegacyOptimized: 22017
// gas Yul: 22885
// gas YulOptimized: 22019
// g(uint256,uint256): 3, 2 -> 9
// gas Legacy: 22563
// gas LegacyOptimized: 22017
// gas Yul: 22885
// gas YulOptimized: 22019
// g(uint256,uint256): 3, 3 -> 0x1b
// gas Legacy: 22563
// gas LegacyOptimized: 22017
// gas Yul: 22885
// gas YulOptimized: 22019
// g(uint256,uint256): 10, 10 -> 10000000000
// gas Legacy: 22563
// gas LegacyOptimized: 22017
// gas Yul: 22885
// gas YulOptimized: 22019
// g(uint256,uint256): 10, 77 -> -15792089237316195423570985008687907853269984665640564039457584007913129639936
// gas Legacy: 22563
// gas LegacyOptimized: 22017
// gas Yul: 22885
// gas YulOptimized: 22019
// g(uint256,uint256): 256, 2 -> 0x010000
// gas Legacy: 22563
// gas LegacyOptimized: 22017
// gas Yul: 22885
// gas YulOptimized: 22019
// g(uint256,uint256): 256, 31 -> 0x0100000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22563
// gas LegacyOptimized: 22017
// gas Yul: 22885
// gas YulOptimized: 22019
