contract C {
    struct S {
        uint8 a;
        uint16 b;
        uint128 c;
        uint d;
    }
    mapping(uint => mapping(uint => S)) public x;
    constructor() {
        x[1][2].a = 3;
        x[1][2].b = 4;
        x[1][2].c = 5;
        x[1][2].d = 6;
    }
}
// ====
// compileViaYul: also
// ----
// x(uint256,uint256): 1, 2 -> 3, 4, 5, 6
// gas Legacy: 25999
// gas LegacyOptimized: 23563
// gas Yul: 27119
// gas YulOptimized: 23558
// x(uint256,uint256): 0, 0 -> 0x00, 0x00, 0x00, 0x00
// gas Legacy: 25975
// gas LegacyOptimized: 23539
// gas Yul: 27095
// gas YulOptimized: 23534
