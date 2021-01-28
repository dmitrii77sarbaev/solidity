contract test {
    mapping(uint => uint[8]) public data;
    mapping(uint => uint[]) public dynamicData;
    constructor() {
        data[2][2] = 8;
        for (uint i = 0; i < 3; i++)
            dynamicData[2].push();
        dynamicData[2][2] = 8;
    }
}
// ====
// compileViaYul: also
// ----
// data(uint256,uint256): 2, 2 -> 8
// gas Legacy: 22989
// gas LegacyOptimized: 22552
// gas Yul: 23871
// gas YulOptimized: 22646
// data(uint256,uint256): 2, 8 -> FAILURE # NB: the original code contained a bug here #
// gas Legacy: 21985
// gas LegacyOptimized: 21654
// gas Yul: 22222
// gas YulOptimized: 21610
// dynamicData(uint256,uint256): 2, 2 -> 8
// gas Legacy: 23862
// gas LegacyOptimized: 23430
// gas Yul: 25549
// gas YulOptimized: 23592
// dynamicData(uint256,uint256): 2, 8 -> FAILURE
// gas Legacy: 22807
// gas LegacyOptimized: 22476
// gas Yul: 23044
// gas YulOptimized: 22501
