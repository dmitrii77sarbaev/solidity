contract C {
    struct Y {
        uint a;
        uint b;
    }
    mapping(uint256 => Y[]) public m;
    mapping(uint256 => Y[3]) public n;
    constructor() {
        m[1].push().a = 1;
        m[1][0].b = 2;
        m[1].push().a = 3;
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
// m(uint256,uint256): 0, 0 -> FAILURE
// gas Legacy: 22783
// gas LegacyOptimized: 22452
// gas Yul: 23023
// gas YulOptimized: 22480
// m(uint256,uint256): 1, 0 -> 1, 2
// gas Legacy: 24787
// gas LegacyOptimized: 24269
// gas Yul: 26624
// gas YulOptimized: 24447
// m(uint256,uint256): 1, 1 -> 3, 4
// gas Legacy: 24799
// gas LegacyOptimized: 24281
// gas Yul: 26636
// gas YulOptimized: 24459
// m(uint256,uint256): 1, 2 -> FAILURE
// gas Legacy: 22807
// gas LegacyOptimized: 22476
// gas Yul: 23047
// gas YulOptimized: 22504
// n(uint256,uint256): 0, 0 -> 0x00, 0x00
// gas Legacy: 23899
// gas LegacyOptimized: 23372
// gas Yul: 24934
// gas YulOptimized: 23481
// n(uint256,uint256): 1, 0 -> 7, 8
// gas Legacy: 23911
// gas LegacyOptimized: 23384
// gas Yul: 24946
// gas YulOptimized: 23493
// n(uint256,uint256): 1, 1 -> 9, 0x0a
// gas Legacy: 23923
// gas LegacyOptimized: 23396
// gas Yul: 24958
// gas YulOptimized: 23505
// n(uint256,uint256): 1, 2 -> 0x00, 0x00
// gas Legacy: 23923
// gas LegacyOptimized: 23396
// gas Yul: 24958
// gas YulOptimized: 23505
