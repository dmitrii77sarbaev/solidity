interface A {}
contract test {
    mapping(A => uint8) public table;
    function set(A k, uint8 v) public {
        table[k] = v;
    }
    function get(A k) public returns (uint8) {
        return this.table(k);
    }
}
// ====
// compileViaYul: also
// ----
// table(address): 0 -> 0
// gas Legacy: 22758
// gas LegacyOptimized: 22443
// gas Yul: 23382
// gas YulOptimized: 22648
// table(address): 0x01 -> 0
// gas Legacy: 22770
// gas LegacyOptimized: 22455
// gas Yul: 23394
// gas YulOptimized: 22660
// table(address): 0xa7 -> 0
// gas Legacy: 22770
// gas LegacyOptimized: 22455
// gas Yul: 23394
// gas YulOptimized: 22660
// get(address): 0 -> 0
// gas Legacy: 25551
// gas LegacyOptimized: 24671
// gas Yul: 26847
// gas YulOptimized: 25033
// get(address): 0x01 -> 0
// gas Legacy: 25563
// gas LegacyOptimized: 24683
// gas Yul: 26859
// gas YulOptimized: 25045
// get(address): 0xa7 -> 0
// gas Legacy: 25563
// gas LegacyOptimized: 24683
// gas Yul: 26859
// gas YulOptimized: 25045
// set(address,uint8): 0x01, 0xa1 ->
// gas Legacy: 42978
// gas LegacyOptimized: 42673
// gas Yul: 43708
// gas YulOptimized: 42851
// table(address): 0 -> 0
// gas Legacy: 22758
// gas LegacyOptimized: 22443
// gas Yul: 23382
// gas YulOptimized: 22648
// table(address): 0x01 -> 0xa1
// gas Legacy: 22770
// gas LegacyOptimized: 22455
// gas Yul: 23394
// gas YulOptimized: 22660
// table(address): 0xa7 -> 0
// gas Legacy: 22770
// gas LegacyOptimized: 22455
// gas Yul: 23394
// gas YulOptimized: 22660
// get(address): 0 -> 0
// gas Legacy: 25551
// gas LegacyOptimized: 24671
// gas Yul: 26847
// gas YulOptimized: 25033
// get(address): 0x01 -> 0xa1
// gas Legacy: 25563
// gas LegacyOptimized: 24683
// gas Yul: 26859
// gas YulOptimized: 25045
// get(address): 0xa7 -> 0
// gas Legacy: 25563
// gas LegacyOptimized: 24683
// gas Yul: 26859
// gas YulOptimized: 25045
// set(address,uint8): 0x00, 0xef ->
// gas Legacy: 42966
// gas LegacyOptimized: 42661
// gas Yul: 43696
// gas YulOptimized: 42839
// table(address): 0 -> 0xef
// gas Legacy: 22758
// gas LegacyOptimized: 22443
// gas Yul: 23382
// gas YulOptimized: 22648
// table(address): 0x01 -> 0xa1
// gas Legacy: 22770
// gas LegacyOptimized: 22455
// gas Yul: 23394
// gas YulOptimized: 22660
// table(address): 0xa7 -> 0
// gas Legacy: 22770
// gas LegacyOptimized: 22455
// gas Yul: 23394
// gas YulOptimized: 22660
// get(address): 0 -> 0xef
// gas Legacy: 25551
// gas LegacyOptimized: 24671
// gas Yul: 26847
// gas YulOptimized: 25033
// get(address): 0x01 -> 0xa1
// gas Legacy: 25563
// gas LegacyOptimized: 24683
// gas Yul: 26859
// gas YulOptimized: 25045
// get(address): 0xa7 -> 0
// gas Legacy: 25563
// gas LegacyOptimized: 24683
// gas Yul: 26859
// gas YulOptimized: 25045
// set(address,uint8): 0x01, 0x05 ->
// gas Legacy: 23778
// gas LegacyOptimized: 23473
// gas Yul: 24508
// gas YulOptimized: 23651
// table(address): 0 -> 0xef
// gas Legacy: 22758
// gas LegacyOptimized: 22443
// gas Yul: 23382
// gas YulOptimized: 22648
// table(address): 0x01 -> 0x05
// gas Legacy: 22770
// gas LegacyOptimized: 22455
// gas Yul: 23394
// gas YulOptimized: 22660
// table(address): 0xa7 -> 0
// gas Legacy: 22770
// gas LegacyOptimized: 22455
// gas Yul: 23394
// gas YulOptimized: 22660
// get(address): 0 -> 0xef
// gas Legacy: 25551
// gas LegacyOptimized: 24671
// gas Yul: 26847
// gas YulOptimized: 25033
// get(address): 0x01 -> 0x05
// gas Legacy: 25563
// gas LegacyOptimized: 24683
// gas Yul: 26859
// gas YulOptimized: 25045
// get(address): 0xa7 -> 0
// gas Legacy: 25563
// gas LegacyOptimized: 24683
// gas Yul: 26859
// gas YulOptimized: 25045
