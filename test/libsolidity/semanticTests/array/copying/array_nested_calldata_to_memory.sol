pragma abicoder v2;

contract c {
    function test1(uint256[][] calldata c) external returns (uint256, uint256) {
        uint256[][] memory a1 = c;
        assert(a1[0][0] == c[0][0]);
        assert(a1[0][1] == c[0][1]);
        return (a1.length, a1[0][0] + a1[1][1]);
    }

    function test2(uint256[][2] calldata c) external returns (uint256, uint256) {
        uint256[][2] memory a2 = c;
        assert(a2[0][0] == c[0][0]);
        assert(a2[0][1] == c[0][1]);
        return (a2[0].length, a2[0][0] + a2[1][1]);
    }

    function test3(uint256[2][] calldata c) external returns (uint256, uint256) {
        uint256[2][] memory a3 = c;
        assert(a3[0][0] == c[0][0]);
        assert(a3[0][1] == c[0][1]);
        return (a3.length, a3[0][0] + a3[1][1]);
    }

    function test4(uint256[2][2] calldata c) external returns (uint256) {
        uint256[2][2] memory a4 = c;
        assert(a4[0][0] == c[0][0]);
        assert(a4[0][1] == c[0][1]);
        return (a4[0][0] + a4[1][1]);
    }
}
// ====
// compileViaYul: also
// ----
// test1(uint256[][]): 0x20, 2, 0x40, 0x40, 2, 23, 42 -> 2, 65
// gas Legacy: 26939
// gas LegacyOptimized: 25293
// gas Yul: 30483
// gas YulOptimized: 26429
// test2(uint256[][2]): 0x20, 0x40, 0x40, 2, 23, 42 -> 2, 65
// gas Legacy: 26598
// gas LegacyOptimized: 24723
// gas Yul: 30277
// gas YulOptimized: 26152
// test3(uint256[2][]): 0x20, 2, 23, 42, 23, 42 -> 2, 65
// gas Legacy: 24084
// gas LegacyOptimized: 23609
// gas Yul: 29695
// gas YulOptimized: 25521
// test4(uint256[2][2]): 23, 42, 23, 42 -> 65
// gas Legacy: 23417
// gas LegacyOptimized: 22636
// gas Yul: 28904
// gas YulOptimized: 24879
