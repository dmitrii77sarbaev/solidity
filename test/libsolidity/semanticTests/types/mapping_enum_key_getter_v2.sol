pragma abicoder               v2;
contract test {
    enum E { A, B, C }
    mapping(E => uint8) public table;
    function set(E k, uint8 v) public {
        table[k] = v;
    }
    function get(E k) public returns (uint8) {
        return this.table(k);
    }
}
// ====
// compileViaYul: also
// ----
// table(uint8): 0 -> 0
// gas Legacy: 22623
// gas LegacyOptimized: 22425
// gas Yul: 23273
// gas YulOptimized: 22690
// table(uint8): 0x01 -> 0
// gas Legacy: 22635
// gas LegacyOptimized: 22437
// gas Yul: 23285
// gas YulOptimized: 22702
// table(uint8): 0xa7 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21412
// gas Yul: 21498
// gas YulOptimized: 21430
// get(uint8): 0 -> 0
// gas Legacy: 25284
// gas LegacyOptimized: 24637
// gas Yul: 26585
// gas YulOptimized: 25068
// get(uint8): 0x01 -> 0
// gas Legacy: 25296
// gas LegacyOptimized: 24649
// gas Yul: 26597
// gas YulOptimized: 25080
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21515
// gas LegacyOptimized: 21456
// gas Yul: 21542
// gas YulOptimized: 21474
// set(uint8,uint8): 0x01, 0xa1 ->
// gas Legacy: 42883
// gas LegacyOptimized: 42718
// gas Yul: 43599
// gas YulOptimized: 42893
// table(uint8): 0 -> 0
// gas Legacy: 22623
// gas LegacyOptimized: 22425
// gas Yul: 23273
// gas YulOptimized: 22690
// table(uint8): 0x01 -> 0xa1
// gas Legacy: 22635
// gas LegacyOptimized: 22437
// gas Yul: 23285
// gas YulOptimized: 22702
// table(uint8): 0xa7 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21412
// gas Yul: 21498
// gas YulOptimized: 21430
// get(uint8): 0 -> 0
// gas Legacy: 25284
// gas LegacyOptimized: 24637
// gas Yul: 26585
// gas YulOptimized: 25068
// get(uint8): 0x01 -> 0xa1
// gas Legacy: 25296
// gas LegacyOptimized: 24649
// gas Yul: 26597
// gas YulOptimized: 25080
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21515
// gas LegacyOptimized: 21456
// gas Yul: 21542
// gas YulOptimized: 21474
// set(uint8,uint8): 0x00, 0xef ->
// gas Legacy: 42871
// gas LegacyOptimized: 42706
// gas Yul: 43587
// gas YulOptimized: 42881
// table(uint8): 0 -> 0xef
// gas Legacy: 22623
// gas LegacyOptimized: 22425
// gas Yul: 23273
// gas YulOptimized: 22690
// table(uint8): 0x01 -> 0xa1
// gas Legacy: 22635
// gas LegacyOptimized: 22437
// gas Yul: 23285
// gas YulOptimized: 22702
// table(uint8): 0xa7 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21412
// gas Yul: 21498
// gas YulOptimized: 21430
// get(uint8): 0 -> 0xef
// gas Legacy: 25284
// gas LegacyOptimized: 24637
// gas Yul: 26585
// gas YulOptimized: 25068
// get(uint8): 0x01 -> 0xa1
// gas Legacy: 25296
// gas LegacyOptimized: 24649
// gas Yul: 26597
// gas YulOptimized: 25080
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21515
// gas LegacyOptimized: 21456
// gas Yul: 21542
// gas YulOptimized: 21474
// set(uint8,uint8): 0x01, 0x05 ->
// gas Legacy: 23683
// gas LegacyOptimized: 23518
// gas Yul: 24399
// gas YulOptimized: 23693
// table(uint8): 0 -> 0xef
// gas Legacy: 22623
// gas LegacyOptimized: 22425
// gas Yul: 23273
// gas YulOptimized: 22690
// table(uint8): 0x01 -> 0x05
// gas Legacy: 22635
// gas LegacyOptimized: 22437
// gas Yul: 23285
// gas YulOptimized: 22702
// table(uint8): 0xa7 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21412
// gas Yul: 21498
// gas YulOptimized: 21430
// get(uint8): 0 -> 0xef
// gas Legacy: 25284
// gas LegacyOptimized: 24637
// gas Yul: 26585
// gas YulOptimized: 25068
// get(uint8): 0x01 -> 0x05
// gas Legacy: 25296
// gas LegacyOptimized: 24649
// gas Yul: 26597
// gas YulOptimized: 25080
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21515
// gas LegacyOptimized: 21456
// gas Yul: 21542
// gas YulOptimized: 21474
