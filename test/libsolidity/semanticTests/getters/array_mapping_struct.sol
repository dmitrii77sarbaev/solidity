contract C {
    struct Y {
        uint a;
        uint b;
    }
    mapping(uint256 => Y)[] public m;
    mapping(uint256 => Y)[3] public n;
    constructor() {
        m.push();
        m.push();
        m[1][0].a = 1;
        m[1][0].b = 2;
        m[1][1].a = 3;
        m[1][1].b = 4;
        n[1][0].a = 7;
        n[1][0].b = 8;
        n[1][1].a = 9;
        n[1][1].b = 10;
    }
}
// ====
// compileViaYul: also
// ----
// m(uint256,uint256): 0, 0 -> 0x00, 0x00
// gas Legacy: 24764
// gas LegacyOptimized: 24244
// gas Yul: 26612
// gas YulOptimized: 24419
// m(uint256,uint256): 1, 0 -> 1, 2
// gas Legacy: 24776
// gas LegacyOptimized: 24256
// gas Yul: 26624
// gas YulOptimized: 24431
// m(uint256,uint256): 1, 1 -> 3, 4
// gas Legacy: 24788
// gas LegacyOptimized: 24268
// gas Yul: 26636
// gas YulOptimized: 24443
// m(uint256,uint256): 1, 2 -> 0x00, 0x00
// gas Legacy: 24788
// gas LegacyOptimized: 24268
// gas Yul: 26636
// gas YulOptimized: 24443
// n(uint256,uint256): 0, 0 -> 0x00, 0x00
// gas Legacy: 23891
// gas LegacyOptimized: 23362
// gas Yul: 24934
// gas YulOptimized: 23465
// n(uint256,uint256): 1, 0 -> 7, 8
// gas Legacy: 23903
// gas LegacyOptimized: 23374
// gas Yul: 24946
// gas YulOptimized: 23477
// n(uint256,uint256): 1, 1 -> 9, 0x0a
// gas Legacy: 23915
// gas LegacyOptimized: 23386
// gas Yul: 24958
// gas YulOptimized: 23489
// n(uint256,uint256): 1, 2 -> 0x00, 0x00
// gas Legacy: 23915
// gas LegacyOptimized: 23386
// gas Yul: 24958
// gas YulOptimized: 23489
