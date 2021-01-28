contract C {
    uint8 public a;
    uint16 public b;
    uint128 public c;
    uint public d;
    bytes1 public e;
    bytes20 public f;
    bytes32 public g;
    bool public h;
    address public i;
    constructor() {
        a = 3;
        b = 4;
        c = 5;
        d = 6;
        e = bytes1(uint8(0x7f));
        f = bytes20(uint160(0x6465616462656566313564656164000000000010));
        g = bytes32(uint256(0x6465616462656566313564656164000000000000000000000000000000000010));
        h = true;
        i = address(type(uint160).max / 3);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// a() -> 3
// gas Legacy: 22233
// gas LegacyOptimized: 22111
// gas Yul: 22734
// gas YulOptimized: 22255
// b() -> 4
// gas Legacy: 22330
// gas LegacyOptimized: 22166
// gas Yul: 22778
// gas YulOptimized: 22305
// c() -> 5
// gas Legacy: 22307
// gas LegacyOptimized: 22167
// gas Yul: 22844
// gas YulOptimized: 22371
// d() -> 6
// gas Legacy: 22260
// gas LegacyOptimized: 22159
// gas Yul: 22788
// gas YulOptimized: 22309
// e() -> 0x7f00000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22323
// gas LegacyOptimized: 22213
// gas Yul: 22960
// gas YulOptimized: 22437
// f() -> 0x6465616462656566313564656164000000000010000000000000000000000000
// gas Legacy: 22308
// gas LegacyOptimized: 22147
// gas Yul: 22803
// gas YulOptimized: 22289
// g() -> 0x6465616462656566313564656164000000000000000000000000000000000010
// gas Legacy: 22237
// gas LegacyOptimized: 22136
// gas Yul: 22854
// gas YulOptimized: 22375
// h() -> true
// gas Legacy: 22235
// gas LegacyOptimized: 22104
// gas Yul: 22822
// gas YulOptimized: 22343
// i() -> 0x5555555555555555555555555555555555555555
// gas Legacy: 22394
// gas LegacyOptimized: 22211
// gas Yul: 22956
// gas YulOptimized: 22439
