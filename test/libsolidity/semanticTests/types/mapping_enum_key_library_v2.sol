pragma abicoder v2;

enum E { A, B, C }
library L {
    function get(mapping(E => uint8) storage table, E k) external returns (uint8) {
        return table[k];
    }
    function set(mapping(E => uint8) storage table, E k, uint8 v) external {
        table[k] = v;
    }
}
contract test {
    mapping(E => uint8) table;
    function get(E k) public returns (uint8 v) {
        return L.get(table, k);
    }
    function set(E k, uint8 v) public {
        L.set(table, k, v);
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// library: L// get(uint8): 0 -> 0
// gas Legacy: 25599
// gas LegacyOptimized: 24812
// gas Yul: 26744
// gas YulOptimized: 25138
// get(uint8): 0x01 -> 0
// gas Legacy: 25611
// gas LegacyOptimized: 24824
// gas Yul: 26756
// gas YulOptimized: 25150
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
// set(uint8,uint8): 0x01, 0xa1 ->
// gas Legacy: 45509
// gas LegacyOptimized: 44755
// gas Yul: 46927
// gas YulOptimized: 45036
// get(uint8): 0 -> 0
// gas Legacy: 25599
// gas LegacyOptimized: 24812
// gas Yul: 26744
// gas YulOptimized: 25138
// get(uint8): 0x01 -> 0xa1
// gas Legacy: 25611
// gas LegacyOptimized: 24824
// gas Yul: 26756
// gas YulOptimized: 25150
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
// set(uint8,uint8): 0x00, 0xef ->
// gas Legacy: 45497
// gas LegacyOptimized: 44743
// gas Yul: 46915
// gas YulOptimized: 45024
// get(uint8): 0 -> 0xef
// gas Legacy: 25599
// gas LegacyOptimized: 24812
// gas Yul: 26744
// gas YulOptimized: 25138
// get(uint8): 0x01 -> 0xa1
// gas Legacy: 25611
// gas LegacyOptimized: 24824
// gas Yul: 26756
// gas YulOptimized: 25150
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
// set(uint8,uint8): 0x01, 0x05 ->
// gas Legacy: 26309
// gas LegacyOptimized: 25555
// gas Yul: 27727
// gas YulOptimized: 25836
// get(uint8): 0 -> 0xef
// gas Legacy: 25599
// gas LegacyOptimized: 24812
// gas Yul: 26744
// gas YulOptimized: 25138
// get(uint8): 0x01 -> 0x05
// gas Legacy: 25611
// gas LegacyOptimized: 24824
// gas Yul: 26756
// gas YulOptimized: 25150
// get(uint8): 0xa7 -> FAILURE
// gas Legacy: 21493
// gas LegacyOptimized: 21434
// gas Yul: 21520
// gas YulOptimized: 21452
