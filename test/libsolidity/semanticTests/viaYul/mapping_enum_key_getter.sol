pragma abicoder               v2;
contract test {
    enum E { A, B, C }
    mapping(E => uint8) public table;
    function set(E k, uint8 v) public {
        table[k] = v;
    }
}
// ====
// compileViaYul: also
// ----
// table(uint8): 0 -> 0
// gas Legacy: 22623
// gas LegacyOptimized: 22425
// gas Yul: 23273
// gas YulOptimized: 22529
// table(uint8): 0x01 -> 0
// gas Legacy: 22635
// gas LegacyOptimized: 22437
// gas Yul: 23285
// gas YulOptimized: 22541
// table(uint8): 0xa7 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21412
// gas Yul: 21498
// gas YulOptimized: 21380
// set(uint8,uint8): 0x01, 0xa1 ->
// gas Legacy: 42883
// gas LegacyOptimized: 42689
// gas Yul: 43599
// gas YulOptimized: 42789
// table(uint8): 0 -> 0
// gas Legacy: 22623
// gas LegacyOptimized: 22425
// gas Yul: 23273
// gas YulOptimized: 22529
// table(uint8): 0x01 -> 0xa1
// gas Legacy: 22635
// gas LegacyOptimized: 22437
// gas Yul: 23285
// gas YulOptimized: 22541
// table(uint8): 0xa7 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21412
// gas Yul: 21498
// gas YulOptimized: 21380
// set(uint8,uint8): 0x00, 0xef ->
// gas Legacy: 42871
// gas LegacyOptimized: 42677
// gas Yul: 43587
// gas YulOptimized: 42777
// table(uint8): 0 -> 0xef
// gas Legacy: 22623
// gas LegacyOptimized: 22425
// gas Yul: 23273
// gas YulOptimized: 22529
// table(uint8): 0x01 -> 0xa1
// gas Legacy: 22635
// gas LegacyOptimized: 22437
// gas Yul: 23285
// gas YulOptimized: 22541
// table(uint8): 0xa7 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21412
// gas Yul: 21498
// gas YulOptimized: 21380
// set(uint8,uint8): 0x01, 0x05 ->
// gas Legacy: 23683
// gas LegacyOptimized: 23489
// gas Yul: 24399
// gas YulOptimized: 23589
// table(uint8): 0 -> 0xef
// gas Legacy: 22623
// gas LegacyOptimized: 22425
// gas Yul: 23273
// gas YulOptimized: 22529
// table(uint8): 0x01 -> 0x05
// gas Legacy: 22635
// gas LegacyOptimized: 22437
// gas Yul: 23285
// gas YulOptimized: 22541
// table(uint8): 0xa7 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21412
// gas Yul: 21498
// gas YulOptimized: 21380
