contract test {
    uint[8] public data;
    uint[] public dynamicData;
    uint24[] public smallTypeData;
    struct st { uint a; uint[] finalArray; }
    mapping(uint256 => mapping(uint256 => st[5])) public multiple_map;

    constructor() {
        data[0] = 8;

        dynamicData.push();
        dynamicData.push();
        dynamicData.push(8);

        smallTypeData = new uint24[](128);
        smallTypeData[1] = 22;
        smallTypeData[127] = 2;

        multiple_map[2][1][2].a = 3;
        for (uint i = 0; i < 4; i++)
            multiple_map[2][1][2].finalArray.push();
        multiple_map[2][1][2].finalArray[3] = 5;
    }
}
// ====
// compileViaYul: also
// ----
// data(uint256): 0 -> 8
// gas Legacy: 22667
// gas LegacyOptimized: 22375
// gas Yul: 23394
// gas YulOptimized: 22524
// data(uint256): 8 -> FAILURE
// gas Legacy: 21677
// gas LegacyOptimized: 21494
// gas Yul: 21759
// gas YulOptimized: 21510
// dynamicData(uint256): 2 -> 8
// gas Legacy: 23464
// gas LegacyOptimized: 23178
// gas Yul: 24996
// gas YulOptimized: 23324
// dynamicData(uint256): 8 -> FAILURE
// gas Legacy: 22411
// gas LegacyOptimized: 22228
// gas Yul: 22493
// gas YulOptimized: 22244
// smallTypeData(uint256): 1 -> 22
// gas Legacy: 23603
// gas LegacyOptimized: 23325
// gas Yul: 25046
// gas YulOptimized: 23393
// smallTypeData(uint256): 127 -> 2
// gas Legacy: 23603
// gas LegacyOptimized: 23325
// gas Yul: 25046
// gas YulOptimized: 23393
// smallTypeData(uint256): 128 -> FAILURE
// gas Legacy: 22433
// gas LegacyOptimized: 22250
// gas Yul: 22515
// gas YulOptimized: 22266
// multiple_map(uint256,uint256,uint256): 2, 1, 2 -> 3
// gas Legacy: 23428
// gas LegacyOptimized: 22832
// gas Yul: 24423
// gas YulOptimized: 23009
