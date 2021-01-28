pragma abicoder               v2;
contract C {
    function test(uint256[][2] calldata a) external returns (uint256) {
        return a.length;
    }
    function test(uint256[][2] calldata a, uint256 i) external returns (uint256) {
        return a[i].length;
    }
    function test(uint256[][2] calldata a, uint256 i, uint256 j) external returns (uint256) {
        return a[i][j];
    }
    function reenc(uint256[][2] calldata a, uint256 i, uint256 j) external returns (uint256) {
        return this.test(a, i, j);
    }
}
// ====
// compileViaYul: also
// ----
// test(uint256[][2]): 0x20, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 2
// gas Legacy: 23407
// gas LegacyOptimized: 23249
// gas Yul: 23748
// gas YulOptimized: 23398
// test(uint256[][2],uint256): 0x40, 0, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 3
// gas Legacy: 24001
// gas LegacyOptimized: 23689
// gas Yul: 24431
// gas YulOptimized: 23861
// test(uint256[][2],uint256): 0x40, 1, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 4
// gas Legacy: 24013
// gas LegacyOptimized: 23701
// gas Yul: 24443
// gas YulOptimized: 23873
// test(uint256[][2],uint256,uint256): 0x60, 0, 0, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A01
// gas Legacy: 24273
// gas LegacyOptimized: 23815
// gas Yul: 24873
// gas YulOptimized: 24050
// reenc(uint256[][2],uint256,uint256): 0x60, 0, 0, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A01
// gas Legacy: 28944
// gas LegacyOptimized: 26967
// gas Yul: 30252
// gas YulOptimized: 27506
// test(uint256[][2],uint256,uint256): 0x60, 0, 1, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A02
// gas Legacy: 24285
// gas LegacyOptimized: 23827
// gas Yul: 24885
// gas YulOptimized: 24062
// reenc(uint256[][2],uint256,uint256): 0x60, 0, 1, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A02
// gas Legacy: 28956
// gas LegacyOptimized: 26979
// gas Yul: 30264
// gas YulOptimized: 27518
// test(uint256[][2],uint256,uint256): 0x60, 0, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A03
// gas Legacy: 24285
// gas LegacyOptimized: 23827
// gas Yul: 24885
// gas YulOptimized: 24062
// reenc(uint256[][2],uint256,uint256): 0x60, 0, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0A03
// gas Legacy: 28956
// gas LegacyOptimized: 26979
// gas Yul: 30264
// gas YulOptimized: 27518
// test(uint256[][2],uint256,uint256): 0x60, 1, 0, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B01
// gas Legacy: 24285
// gas LegacyOptimized: 23827
// gas Yul: 24885
// gas YulOptimized: 24062
// reenc(uint256[][2],uint256,uint256): 0x60, 1, 0, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B01
// gas Legacy: 28956
// gas LegacyOptimized: 26979
// gas Yul: 30264
// gas YulOptimized: 27518
// test(uint256[][2],uint256,uint256): 0x60, 1, 1, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B02
// gas Legacy: 24297
// gas LegacyOptimized: 23839
// gas Yul: 24897
// gas YulOptimized: 24074
// reenc(uint256[][2],uint256,uint256): 0x60, 1, 1, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B02
// gas Legacy: 28968
// gas LegacyOptimized: 26991
// gas Yul: 30276
// gas YulOptimized: 27530
// test(uint256[][2],uint256,uint256): 0x60, 1, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B03
// gas Legacy: 24297
// gas LegacyOptimized: 23839
// gas Yul: 24897
// gas YulOptimized: 24074
// reenc(uint256[][2],uint256,uint256): 0x60, 1, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B03
// gas Legacy: 28968
// gas LegacyOptimized: 26991
// gas Yul: 30276
// gas YulOptimized: 27530
// test(uint256[][2],uint256,uint256): 0x60, 1, 3, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B04
// gas Legacy: 24297
// gas LegacyOptimized: 23839
// gas Yul: 24897
// gas YulOptimized: 24074
// reenc(uint256[][2],uint256,uint256): 0x60, 1, 3, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> 0x0B04
// gas Legacy: 28968
// gas LegacyOptimized: 26991
// gas Yul: 30276
// gas YulOptimized: 27530
// test(uint256[][2],uint256,uint256): 0x60, 0, 3, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 24084
// gas LegacyOptimized: 23733
// gas Yul: 24297
// gas YulOptimized: 23806
// test(uint256[][2],uint256,uint256): 0x60, 1, 4, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 24096
// gas LegacyOptimized: 23745
// gas Yul: 24309
// gas YulOptimized: 23818
// test(uint256[][2],uint256): 0x40, 2, 0x40, 0xC0, 3, 0x0A01, 0x0A02, 0x0A03, 4, 0x0B01, 0x0B02, 0x0B03, 0x0B04 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23610
// gas LegacyOptimized: 23420
// gas Yul: 23738
// gas YulOptimized: 23463
