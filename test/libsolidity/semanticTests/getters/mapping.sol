contract C {
    mapping(uint => mapping(uint => uint)) public x;
    constructor() {
        x[1][2] = 3;
    }
}
// ====
// compileViaYul: also
// ----
// x(uint256,uint256): 1, 2 -> 3
// gas Legacy: 23023
// gas LegacyOptimized: 22582
// gas Yul: 23788
// gas YulOptimized: 22451
// x(uint256,uint256): 0, 0 -> 0
// gas Legacy: 22999
// gas LegacyOptimized: 22558
// gas Yul: 23764
// gas YulOptimized: 22427
