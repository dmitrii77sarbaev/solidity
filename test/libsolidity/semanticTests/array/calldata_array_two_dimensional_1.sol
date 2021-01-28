pragma abicoder               v2;
contract C {
    function test(uint256[][] calldata a) external returns (uint256) {
        return a.length;
    }
    function test(uint256[][] calldata a, uint256 i) external returns (uint256) {
        return a[i].length;
    }
    function test(uint256[][] calldata a, uint256 i, uint256 j) external returns (uint256) {
        return a[i][j];
    }
    function reenc(uint256[][] calldata a, uint256 i, uint256 j) external returns (uint256) {
        return this.test(a, i, j);
    }
}
// ====
// compileViaYul: also
// ----
// test(uint256[][]): 0x20, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 2
// gas Legacy: 23690
// gas LegacyOptimized: 23544
// gas Yul: 24040
// gas YulOptimized: 23707
// test(uint256[][],uint256): 0x40, 0, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 3
// gas Legacy: 24215
// gas LegacyOptimized: 23927
// gas Yul: 24651
// gas YulOptimized: 24105
// test(uint256[][],uint256): 0x40, 1, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 4
// gas Legacy: 24227
// gas LegacyOptimized: 23939
// gas Yul: 24663
// gas YulOptimized: 24117
// test(uint256[][],uint256,uint256): 0x60, 0, 0, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A01
// gas Legacy: 24515
// gas LegacyOptimized: 24070
// gas Yul: 25121
// gas YulOptimized: 24327
// reenc(uint256[][],uint256,uint256): 0x60, 0, 0, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A01
// gas Legacy: 29241
// gas LegacyOptimized: 27353
// gas Yul: 30560
// gas YulOptimized: 27920
// test(uint256[][],uint256,uint256): 0x60, 0, 1, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A02
// gas Legacy: 24527
// gas LegacyOptimized: 24082
// gas Yul: 25133
// gas YulOptimized: 24339
// reenc(uint256[][],uint256,uint256): 0x60, 0, 1, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A02
// gas Legacy: 29253
// gas LegacyOptimized: 27365
// gas Yul: 30572
// gas YulOptimized: 27932
// test(uint256[][],uint256,uint256): 0x60, 0, 2, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A03
// gas Legacy: 24527
// gas LegacyOptimized: 24082
// gas Yul: 25133
// gas YulOptimized: 24339
// reenc(uint256[][],uint256,uint256): 0x60, 0, 2, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A03
// gas Legacy: 29253
// gas LegacyOptimized: 27365
// gas Yul: 30572
// gas YulOptimized: 27932
// test(uint256[][],uint256,uint256): 0x60, 1, 0, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B01
// gas Legacy: 24527
// gas LegacyOptimized: 24082
// gas Yul: 25133
// gas YulOptimized: 24339
// reenc(uint256[][],uint256,uint256): 0x60, 1, 0, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B01
// gas Legacy: 29253
// gas LegacyOptimized: 27365
// gas Yul: 30572
// gas YulOptimized: 27932
// test(uint256[][],uint256,uint256): 0x60, 1, 1, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B02
// gas Legacy: 24539
// gas LegacyOptimized: 24094
// gas Yul: 25145
// gas YulOptimized: 24351
// reenc(uint256[][],uint256,uint256): 0x60, 1, 1, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B02
// gas Legacy: 29265
// gas LegacyOptimized: 27377
// gas Yul: 30584
// gas YulOptimized: 27944
// test(uint256[][],uint256,uint256): 0x60, 1, 2, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B03
// gas Legacy: 24539
// gas LegacyOptimized: 24094
// gas Yul: 25145
// gas YulOptimized: 24351
// reenc(uint256[][],uint256,uint256): 0x60, 1, 2, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B03
// gas Legacy: 29265
// gas LegacyOptimized: 27377
// gas Yul: 30584
// gas YulOptimized: 27944
// test(uint256[][],uint256,uint256): 0x60, 1, 3, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B04
// gas Legacy: 24539
// gas LegacyOptimized: 24094
// gas Yul: 25145
// gas YulOptimized: 24351
// reenc(uint256[][],uint256,uint256): 0x60, 1, 3, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B04
// gas Legacy: 29265
// gas LegacyOptimized: 27377
// gas Yul: 30584
// gas YulOptimized: 27944
// test(uint256[][],uint256,uint256): 0x60, 0, 3, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 24324
// gas LegacyOptimized: 23986
// gas Yul: 24543
// gas YulOptimized: 24079
// test(uint256[][],uint256,uint256): 0x60, 1, 4, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 24336
// gas LegacyOptimized: 23998
// gas Yul: 24555
// gas YulOptimized: 24091
// test(uint256[][],uint256): 0x40, 2, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23817
// gas LegacyOptimized: 23655
// gas Yul: 23954
// gas YulOptimized: 23703
