interface A {}
library L {
    function get(mapping(A => uint8) storage table, A k) external returns (uint8) {
        return table[k];
    }
    function set(mapping(A => uint8) storage table, A k, uint8 v) external {
        table[k] = v;
    }
}
contract test {
    mapping(A => uint8) table;
    function get(A k) public returns (uint8 v) {
        return L.get(table, k);
    }
    function set(A k, uint8 v) public {
        L.set(table, k, v);
    }
}
// ====
// compileViaYul: also
// ----
// library: L// get(address): 0 -> 0
// gas Legacy: 25804
// gas LegacyOptimized: 24721
// gas Yul: 26984
// gas YulOptimized: 25019
// get(address): 0x01 -> 0
// gas Legacy: 25816
// gas LegacyOptimized: 24733
// gas Yul: 26996
// gas YulOptimized: 25031
// get(address): 0xa7 -> 0
// gas Legacy: 25816
// gas LegacyOptimized: 24733
// gas Yul: 26996
// gas YulOptimized: 25031
// set(address,uint8): 0x01, 0xa1 ->
// gas Legacy: 45758
// gas LegacyOptimized: 44711
// gas Yul: 47211
// gas YulOptimized: 45124
// get(address): 0 -> 0
// gas Legacy: 25804
// gas LegacyOptimized: 24721
// gas Yul: 26984
// gas YulOptimized: 25019
// get(address): 0x01 -> 0xa1
// gas Legacy: 25816
// gas LegacyOptimized: 24733
// gas Yul: 26996
// gas YulOptimized: 25031
// get(address): 0xa7 -> 0
// gas Legacy: 25816
// gas LegacyOptimized: 24733
// gas Yul: 26996
// gas YulOptimized: 25031
// set(address,uint8): 0x00, 0xef ->
// gas Legacy: 45746
// gas LegacyOptimized: 44699
// gas Yul: 47199
// gas YulOptimized: 45112
// get(address): 0 -> 0xef
// gas Legacy: 25804
// gas LegacyOptimized: 24721
// gas Yul: 26984
// gas YulOptimized: 25019
// get(address): 0x01 -> 0xa1
// gas Legacy: 25816
// gas LegacyOptimized: 24733
// gas Yul: 26996
// gas YulOptimized: 25031
// get(address): 0xa7 -> 0
// gas Legacy: 25816
// gas LegacyOptimized: 24733
// gas Yul: 26996
// gas YulOptimized: 25031
// set(address,uint8): 0x01, 0x05 ->
// gas Legacy: 26558
// gas LegacyOptimized: 25511
// gas Yul: 28011
// gas YulOptimized: 25924
// get(address): 0 -> 0xef
// gas Legacy: 25804
// gas LegacyOptimized: 24721
// gas Yul: 26984
// gas YulOptimized: 25019
// get(address): 0x01 -> 0x05
// gas Legacy: 25816
// gas LegacyOptimized: 24733
// gas Yul: 26996
// gas YulOptimized: 25031
// get(address): 0xa7 -> 0
// gas Legacy: 25816
// gas LegacyOptimized: 24733
// gas Yul: 26996
// gas YulOptimized: 25031
