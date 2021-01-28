contract test {
    mapping(uint256 => uint256) public m1;
    mapping(uint256 => mapping(uint256 => uint256)) public m2;
    function set(uint256 k, uint256 v) public {
        m1[k] = v;
    }
    function set(uint256 k1, uint256 k2, uint256 v) public {
        m2[k1][k2] = v;
    }
}
// ====
// compileViaYul: also
// ----
// m1(uint256): 0 -> 0
// gas Legacy: 22657
// gas LegacyOptimized: 22366
// gas Yul: 23268
// gas YulOptimized: 22514
// m1(uint256): 0x01 -> 0
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
// m1(uint256): 0xa7 -> 0
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
// set(uint256,uint256): 0x01, 0xa1 ->
// gas Legacy: 41993
// gas LegacyOptimized: 41641
// gas Yul: 43558
// gas YulOptimized: 41789
// m1(uint256): 0 -> 0
// gas Legacy: 22657
// gas LegacyOptimized: 22366
// gas Yul: 23268
// gas YulOptimized: 22514
// m1(uint256): 0x01 -> 0xa1
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
// m1(uint256): 0xa7 -> 0
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
// set(uint256,uint256): 0x00, 0xef ->
// gas Legacy: 41981
// gas LegacyOptimized: 41629
// gas Yul: 43546
// gas YulOptimized: 41777
// m1(uint256): 0 -> 0xef
// gas Legacy: 22657
// gas LegacyOptimized: 22366
// gas Yul: 23268
// gas YulOptimized: 22514
// m1(uint256): 0x01 -> 0xa1
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
// m1(uint256): 0xa7 -> 0
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
// set(uint256,uint256): 0x01, 0x05 ->
// gas Legacy: 22793
// gas LegacyOptimized: 22441
// gas Yul: 24358
// gas YulOptimized: 22589
// m1(uint256): 0 -> 0xef
// gas Legacy: 22657
// gas LegacyOptimized: 22366
// gas Yul: 23268
// gas YulOptimized: 22514
// m1(uint256): 0x01 -> 0x05
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
// m1(uint256): 0xa7 -> 0
// gas Legacy: 22669
// gas LegacyOptimized: 22378
// gas Yul: 23280
// gas YulOptimized: 22526
// m2(uint256,uint256): 0, 0 -> 0
// gas Legacy: 23065
// gas LegacyOptimized: 22630
// gas Yul: 23831
// gas YulOptimized: 22899
// m2(uint256,uint256): 0, 0x01 -> 0
// gas Legacy: 23077
// gas LegacyOptimized: 22642
// gas Yul: 23843
// gas YulOptimized: 22911
// m2(uint256,uint256): 0xa7, 0 -> 0
// gas Legacy: 23077
// gas LegacyOptimized: 22642
// gas Yul: 23843
// gas YulOptimized: 22911
// m2(uint256,uint256): 0xa7, 0x01 -> 0
// gas Legacy: 23089
// gas LegacyOptimized: 22654
// gas Yul: 23855
// gas YulOptimized: 22923
// set(uint256,uint256,uint256): 0xa7, 0x01, 0x23
// gas Legacy: 42425
// gas LegacyOptimized: 41914
// gas Yul: 44119
// gas YulOptimized: 42068
// m2(uint256,uint256): 0, 0x01 -> 0
// gas Legacy: 23077
// gas LegacyOptimized: 22642
// gas Yul: 23843
// gas YulOptimized: 22911
// m2(uint256,uint256): 0xa7, 0 -> 0
// gas Legacy: 23077
// gas LegacyOptimized: 22642
// gas Yul: 23843
// gas YulOptimized: 22911
// m2(uint256,uint256): 0xa7, 0x01 -> 0x23
// gas Legacy: 23089
// gas LegacyOptimized: 22654
// gas Yul: 23855
// gas YulOptimized: 22923
// set(uint256,uint256,uint256): 0, 0x01, 0xef
// gas Legacy: 42413
// gas LegacyOptimized: 41902
// gas Yul: 44107
// gas YulOptimized: 42056
// m2(uint256,uint256): 0, 0x01 -> 0xef
// gas Legacy: 23077
// gas LegacyOptimized: 22642
// gas Yul: 23843
// gas YulOptimized: 22911
// m2(uint256,uint256): 0xa7, 0 -> 0
// gas Legacy: 23077
// gas LegacyOptimized: 22642
// gas Yul: 23843
// gas YulOptimized: 22911
// m2(uint256,uint256): 0xa7, 0x01 -> 0x23
// gas Legacy: 23089
// gas LegacyOptimized: 22654
// gas Yul: 23855
// gas YulOptimized: 22923
