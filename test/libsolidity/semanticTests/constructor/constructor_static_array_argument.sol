contract C {
    uint256 public a;
    uint256[3] public b;

    constructor(uint256 _a, uint256[3] memory _b) {
        a = _a;
        b = _b;
    }
}

// ====
// compileViaYul: also
// ----
// constructor(): 1, 2, 3, 4 ->
// gas Legacy: 231362
// gas LegacyOptimized: 193796
// gas Yul: 323680
// gas YulOptimized: 203246
// a() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
// b(uint256): 0 -> 2
// gas Legacy: 22623
// gas LegacyOptimized: 22331
// gas Yul: 23350
// gas YulOptimized: 22440
// b(uint256): 1 -> 3
// gas Legacy: 22635
// gas LegacyOptimized: 22343
// gas Yul: 23362
// gas YulOptimized: 22452
// b(uint256): 2 -> 4
// gas Legacy: 22635
// gas LegacyOptimized: 22343
// gas Yul: 23362
// gas YulOptimized: 22452
