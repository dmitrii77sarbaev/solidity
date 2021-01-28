contract C {
    function f(uint256[] calldata x, uint256 start, uint256 end) external pure {
        x[start:end];
    }
    function g(uint256[] calldata x, uint256 start, uint256 end, uint256 index) external pure returns (uint256, uint256, uint256) {
        return (x[start:end][index], x[start:][0:end-start][index], x[:end][start:][index]);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256[],uint256,uint256): 0x80, 0, 0, 0, 1, 42 ->
// gas Legacy: 22835
// gas LegacyOptimized: 22471
// gas Yul: 22516
// gas YulOptimized: 22516
// f(uint256[],uint256,uint256): 0x80, 0, 1, 0, 1, 42 ->
// gas Legacy: 22847
// gas LegacyOptimized: 22483
// gas Yul: 22528
// gas YulOptimized: 22528
// f(uint256[],uint256,uint256): 0x80, 0, 2, 0, 1, 42 -> FAILURE
// gas Legacy: 22769
// gas LegacyOptimized: 22420
// gas Yul: 22336
// gas YulOptimized: 22336
// f(uint256[],uint256,uint256): 0x80, 1, 0, 0, 1, 42 -> FAILURE
// gas Legacy: 22743
// gas LegacyOptimized: 22394
// gas Yul: 22310
// gas YulOptimized: 22310
// f(uint256[],uint256,uint256): 0x80, 1, 1, 0, 1, 42 ->
// gas Legacy: 22859
// gas LegacyOptimized: 22495
// gas Yul: 22540
// gas YulOptimized: 22540
// f(uint256[],uint256,uint256): 0x80, 1, 2, 0, 1, 42 -> FAILURE
// gas Legacy: 22781
// gas LegacyOptimized: 22432
// gas Yul: 22348
// gas YulOptimized: 22348
// f(uint256[],uint256,uint256): 0x80, 2, 0, 0, 1, 42 -> FAILURE
// gas Legacy: 22743
// gas LegacyOptimized: 22394
// gas Yul: 22310
// gas YulOptimized: 22310
// f(uint256[],uint256,uint256): 0x80, 2, 1, 0, 1, 42 -> FAILURE
// gas Legacy: 22755
// gas LegacyOptimized: 22406
// gas Yul: 22322
// gas YulOptimized: 22322
// f(uint256[],uint256,uint256): 0x80, 2, 2, 0, 1, 42 -> FAILURE
// gas Legacy: 22781
// gas LegacyOptimized: 22432
// gas Yul: 22348
// gas YulOptimized: 22348
// f(uint256[],uint256,uint256): 0x80, 0, 2, 1, 0, 42 -> FAILURE
// gas Legacy: 22769
// gas LegacyOptimized: 22420
// gas Yul: 22336
// gas YulOptimized: 22336
// f(uint256[],uint256,uint256): 0x80, 1, 2, 0, 2, 42, 23 ->
// gas Legacy: 22999
// gas LegacyOptimized: 22635
// gas Yul: 22680
// gas YulOptimized: 22680
// f(uint256[],uint256,uint256): 0x80, 1, 3, 0, 2, 42, 23 -> FAILURE
// gas Legacy: 22921
// gas LegacyOptimized: 22572
// gas Yul: 22488
// gas YulOptimized: 22488
// f(uint256[],uint256,uint256): 0x80, -1, 0, 0, 1, 42 -> FAILURE
// gas Legacy: 23115
// gas LegacyOptimized: 22766
// gas Yul: 22682
// gas YulOptimized: 22682
// f(uint256[],uint256,uint256): 0x80, -1, -1, 0, 1, 42 -> FAILURE
// gas Legacy: 23525
// gas LegacyOptimized: 23176
// gas Yul: 23092
// gas YulOptimized: 23092
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 1, 0, 1, 42 -> 42, 42, 42
// gas Legacy: 24424
// gas LegacyOptimized: 23442
// gas Yul: 23892
// gas YulOptimized: 23892
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 1, 1, 1, 42 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23089
// gas LegacyOptimized: 22580
// gas Yul: 22683
// gas YulOptimized: 22683
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 0, 0, 1, 42 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23065
// gas LegacyOptimized: 22556
// gas Yul: 22659
// gas YulOptimized: 22659
// g(uint256[],uint256,uint256,uint256): 0x80, 1, 1, 0, 1, 42 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23089
// gas LegacyOptimized: 22580
// gas Yul: 22683
// gas YulOptimized: 22683
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 5, 0, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4201, 0x4201, 0x4201
// gas Legacy: 25044
// gas LegacyOptimized: 24062
// gas Yul: 24512
// gas YulOptimized: 24512
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 5, 4, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4205, 0x4205, 0x4205
// gas Legacy: 25056
// gas LegacyOptimized: 24074
// gas Yul: 24524
// gas YulOptimized: 24524
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 5, 5, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23709
// gas LegacyOptimized: 23200
// gas Yul: 23303
// gas YulOptimized: 23303
// g(uint256[],uint256,uint256,uint256): 0x80, 1, 5, 0, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4202, 0x4202, 0x4202
// gas Legacy: 25056
// gas LegacyOptimized: 24074
// gas Yul: 24524
// gas YulOptimized: 24524
// g(uint256[],uint256,uint256,uint256): 0x80, 1, 5, 3, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4205, 0x4205, 0x4205
// gas Legacy: 25068
// gas LegacyOptimized: 24086
// gas Yul: 24536
// gas YulOptimized: 24536
// g(uint256[],uint256,uint256,uint256): 0x80, 1, 5, 4, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23721
// gas LegacyOptimized: 23212
// gas Yul: 23315
// gas YulOptimized: 23315
// g(uint256[],uint256,uint256,uint256): 0x80, 4, 5, 0, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4205, 0x4205, 0x4205
// gas Legacy: 25056
// gas LegacyOptimized: 24074
// gas Yul: 24524
// gas YulOptimized: 24524
// g(uint256[],uint256,uint256,uint256): 0x80, 4, 5, 1, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23721
// gas LegacyOptimized: 23212
// gas Yul: 23315
// gas YulOptimized: 23315
// g(uint256[],uint256,uint256,uint256): 0x80, 5, 5, 0, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23709
// gas LegacyOptimized: 23200
// gas Yul: 23303
// gas YulOptimized: 23303
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 1, 0, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4201, 0x4201, 0x4201
// gas Legacy: 25044
// gas LegacyOptimized: 24062
// gas Yul: 24512
// gas YulOptimized: 24512
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 1, 1, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23709
// gas LegacyOptimized: 23200
// gas Yul: 23303
// gas YulOptimized: 23303
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 1, 0, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4201, 0x4201, 0x4201
// gas Legacy: 25044
// gas LegacyOptimized: 24062
// gas Yul: 24512
// gas YulOptimized: 24512
// g(uint256[],uint256,uint256,uint256): 0x80, 0, 1, 1, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23709
// gas LegacyOptimized: 23200
// gas Yul: 23303
// gas YulOptimized: 23303
// g(uint256[],uint256,uint256,uint256): 0x80, 1, 2, 0, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4202, 0x4202, 0x4202
// gas Legacy: 25056
// gas LegacyOptimized: 24074
// gas Yul: 24524
// gas YulOptimized: 24524
// g(uint256[],uint256,uint256,uint256): 0x80, 1, 2, 1, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23721
// gas LegacyOptimized: 23212
// gas Yul: 23315
// gas YulOptimized: 23315
// g(uint256[],uint256,uint256,uint256): 0x80, 4, 5, 0, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> 0x4205, 0x4205, 0x4205
// gas Legacy: 25056
// gas LegacyOptimized: 24074
// gas Yul: 24524
// gas YulOptimized: 24524
// g(uint256[],uint256,uint256,uint256): 0x80, 4, 5, 1, 5, 0x4201, 0x4202, 0x4203, 0x4204, 0x4205 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23721
// gas LegacyOptimized: 23212
// gas Yul: 23315
// gas YulOptimized: 23315
