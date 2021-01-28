interface A {}
contract test {
    mapping(A => uint8) table;
    function get(A k) public returns (uint8 v) {
        return table[k];
    }
    function set(A k, uint8 v) public {
        table[k] = v;
    }
}
// ====
// compileViaYul: also
// ----
// get(address): 0 -> 0
// gas Legacy: 22818
// gas LegacyOptimized: 22492
// gas Yul: 23412
// gas YulOptimized: 22635
// get(address): 0x01 -> 0
// gas Legacy: 22830
// gas LegacyOptimized: 22504
// gas Yul: 23424
// gas YulOptimized: 22647
// get(address): 0xa7 -> 0
// gas Legacy: 22830
// gas LegacyOptimized: 22504
// gas Yul: 23424
// gas YulOptimized: 22647
// set(address,uint8): 0x01, 0xa1 ->
// gas Legacy: 42956
// gas LegacyOptimized: 42622
// gas Yul: 43686
// gas YulOptimized: 42696
// get(address): 0 -> 0
// gas Legacy: 22818
// gas LegacyOptimized: 22492
// gas Yul: 23412
// gas YulOptimized: 22635
// get(address): 0x01 -> 0xa1
// gas Legacy: 22830
// gas LegacyOptimized: 22504
// gas Yul: 23424
// gas YulOptimized: 22647
// get(address): 0xa7 -> 0
// gas Legacy: 22830
// gas LegacyOptimized: 22504
// gas Yul: 23424
// gas YulOptimized: 22647
// set(address,uint8): 0x00, 0xef ->
// gas Legacy: 42944
// gas LegacyOptimized: 42610
// gas Yul: 43674
// gas YulOptimized: 42684
// get(address): 0 -> 0xef
// gas Legacy: 22818
// gas LegacyOptimized: 22492
// gas Yul: 23412
// gas YulOptimized: 22635
// get(address): 0x01 -> 0xa1
// gas Legacy: 22830
// gas LegacyOptimized: 22504
// gas Yul: 23424
// gas YulOptimized: 22647
// get(address): 0xa7 -> 0
// gas Legacy: 22830
// gas LegacyOptimized: 22504
// gas Yul: 23424
// gas YulOptimized: 22647
// set(address,uint8): 0x01, 0x05 ->
// gas Legacy: 23756
// gas LegacyOptimized: 23422
// gas Yul: 24486
// gas YulOptimized: 23496
// get(address): 0 -> 0xef
// gas Legacy: 22818
// gas LegacyOptimized: 22492
// gas Yul: 23412
// gas YulOptimized: 22635
// get(address): 0x01 -> 0x05
// gas Legacy: 22830
// gas LegacyOptimized: 22504
// gas Yul: 23424
// gas YulOptimized: 22647
// get(address): 0xa7 -> 0
// gas Legacy: 22830
// gas LegacyOptimized: 22504
// gas Yul: 23424
// gas YulOptimized: 22647
