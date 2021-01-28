contract C {
    uint8[][2] public a;
    constructor() {
        a[1].push(3);
        a[1].push(4);
    }
}
// ====
// compileViaYul: also
// ----
// a(uint256,uint256): 0, 0 -> FAILURE
// gas Legacy: 22727
// gas LegacyOptimized: 22396
// gas Yul: 23074
// gas YulOptimized: 22330
// a(uint256,uint256): 1, 0 -> 3
// gas Legacy: 23859
// gas LegacyOptimized: 23433
// gas Yul: 25619
// gas YulOptimized: 23452
// a(uint256,uint256): 1, 1 -> 4
// gas Legacy: 23921
// gas LegacyOptimized: 23495
// gas Yul: 25631
// gas YulOptimized: 23464
// a(uint256,uint256): 2, 0 -> FAILURE
// gas Legacy: 21910
// gas LegacyOptimized: 21579
// gas Yul: 22001
// gas YulOptimized: 21513
