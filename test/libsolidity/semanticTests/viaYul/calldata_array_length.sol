pragma abicoder               v2;
contract C {
    function f(uint256[] calldata x) external returns (uint256) {
        return x.length;
    }
    function f(uint256[][] calldata x) external returns (uint256 l1, uint256 l2, uint256 l3) {
        l1 = x.length;
        if (l1 > 0) l2 = x[0].length;
        if (l1 > 1) l3 = x[1].length;
    }
    function f(uint256[2] calldata x) external returns (uint256) {
        return x.length;
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256[]): 0x20, 0 -> 0
// gas Legacy: 22010
// gas LegacyOptimized: 21864
// gas Yul: 22360
// gas YulOptimized: 21937
// f(uint256[]): 0x20, 1, 23 -> 1
// gas Legacy: 22162
// gas LegacyOptimized: 22016
// gas Yul: 22512
// gas YulOptimized: 22089
// f(uint256[]): 0x20, 2, 23, 42 -> 2
// gas Legacy: 22302
// gas LegacyOptimized: 22156
// gas Yul: 22652
// gas YulOptimized: 22229
// f(uint256[]): 0x20, 3, 23, 42, 17 -> 3
// gas Legacy: 22442
// gas LegacyOptimized: 22296
// gas Yul: 22792
// gas YulOptimized: 22369
// f(uint256[2]): 23, 42 -> 2
// gas Legacy: 21866
// gas LegacyOptimized: 21658
// gas Yul: 22202
// gas YulOptimized: 21768
// f(uint256[][]): 0x20, 0 -> 0, 0, 0
// gas Legacy: 22293
// gas LegacyOptimized: 21991
// gas Yul: 22927
// gas YulOptimized: 22139
// f(uint256[][]): 0x20, 1, 0x20, 0 -> 1, 0, 0
// gas Legacy: 22838
// gas LegacyOptimized: 22520
// gas Yul: 23680
// gas YulOptimized: 22697
// f(uint256[][]): 0x20, 1, 0x00 -> 1, 0, 0
// gas Legacy: 22698
// gas LegacyOptimized: 22380
// gas Yul: 23540
// gas YulOptimized: 22557
// f(uint256[][]): 0x20, 1, 0x20, 1, 23 -> 1, 1, 0
// gas Legacy: 22990
// gas LegacyOptimized: 22672
// gas Yul: 23832
// gas YulOptimized: 22849
// f(uint256[][]): 0x20, 1, 0x20, 2, 23, 42 -> 1, 2, 0
// gas Legacy: 23130
// gas LegacyOptimized: 22812
// gas Yul: 23972
// gas YulOptimized: 22989
// f(uint256[][]): 0x20, 1, 0x40, 0, 2, 23, 42 -> 1, 2, 0
// gas Legacy: 23258
// gas LegacyOptimized: 22940
// gas Yul: 24100
// gas YulOptimized: 23117
// f(uint256[][]): 0x20, 1, -32 -> 1, 1, 0
// gas Legacy: 23082
// gas LegacyOptimized: 22764
// gas Yul: 23924
// gas YulOptimized: 22941
// f(uint256[][]): 0x20, 2, 0x40, 0x40, 2, 23, 42 -> 2, 2, 2
// gas Legacy: 23535
// gas LegacyOptimized: 23201
// gas Yul: 24585
// gas YulOptimized: 23407
// f(uint256[][]): 0x20, 2, 0x40, 0xa0, 2, 23, 42, 0 -> 2, 2, 0
// gas Legacy: 23663
// gas LegacyOptimized: 23329
// gas Yul: 24713
// gas YulOptimized: 23535
// f(uint256[][]): 0x20, 2, 0xA0, 0x40, 2, 23, 42, 0 -> 2, 0, 2
// gas Legacy: 23663
// gas LegacyOptimized: 23329
// gas Yul: 24713
// gas YulOptimized: 23535
// f(uint256[][]): 0x20, 2, 0x40, 0xA0, 2, 23, 42, 1, 17 -> 2, 2, 1
// gas Legacy: 23815
// gas LegacyOptimized: 23481
// gas Yul: 24865
// gas YulOptimized: 23687
// f(uint256[][]): 0x20, 2, 0x40, 0xA0, 2, 23, 42, 2, 17, 13 -> 2, 2, 2
// gas Legacy: 23955
// gas LegacyOptimized: 23621
// gas Yul: 25005
// gas YulOptimized: 23827
