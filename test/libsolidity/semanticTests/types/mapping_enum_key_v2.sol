pragma abicoder v2;
enum E { A, B, C }
contract test {
    mapping(E => uint8) table;
    function get(E k) public returns (uint8 v) {
        return table[k];
    }
    function set(E k, uint8 v) public {
        table[k] = v;
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// get(uint8): 0 -> 0
// gas Legacy: 22723
// gas LegacyOptimized: 22528
// gas Yul: 23303
// gas YulOptimized: 22677
// get(uint8): 0x01 -> 0
// gas Legacy: 22735
// gas LegacyOptimized: 22540
// gas Yul: 23315
// gas YulOptimized: 22689
// get(uint8): 0x02 -> 0
// gas Legacy: 22735
// gas LegacyOptimized: 22540
// gas Yul: 23315
// gas YulOptimized: 22689
// get(uint8): 0x03 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
// set(uint8,uint8): 0x01, 0xa1 ->
// gas Legacy: 42861
// gas LegacyOptimized: 42667
// gas Yul: 43577
// gas YulOptimized: 42738
// get(uint8): 0 -> 0
// gas Legacy: 22723
// gas LegacyOptimized: 22528
// gas Yul: 23303
// gas YulOptimized: 22677
// get(uint8): 0x01 -> 0xa1
// gas Legacy: 22735
// gas LegacyOptimized: 22540
// gas Yul: 23315
// gas YulOptimized: 22689
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
// set(uint8,uint8): 0x00, 0xef ->
// gas Legacy: 42849
// gas LegacyOptimized: 42655
// gas Yul: 43565
// gas YulOptimized: 42726
// get(uint8): 0 -> 0xef
// gas Legacy: 22723
// gas LegacyOptimized: 22528
// gas Yul: 23303
// gas YulOptimized: 22677
// get(uint8): 0x01 -> 0xa1
// gas Legacy: 22735
// gas LegacyOptimized: 22540
// gas Yul: 23315
// gas YulOptimized: 22689
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
// set(uint8,uint8): 0x01, 0x05 ->
// gas Legacy: 23661
// gas LegacyOptimized: 23467
// gas Yul: 24377
// gas YulOptimized: 23538
// get(uint8): 0 -> 0xef
// gas Legacy: 22723
// gas LegacyOptimized: 22528
// gas Yul: 23303
// gas YulOptimized: 22677
// get(uint8): 0x01 -> 0x05
// gas Legacy: 22735
// gas LegacyOptimized: 22540
// gas Yul: 23315
// gas YulOptimized: 22689
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
