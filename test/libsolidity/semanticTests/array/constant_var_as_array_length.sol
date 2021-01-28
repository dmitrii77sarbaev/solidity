contract C {
    uint256 constant LEN = 3;
    uint256[LEN] public a;

    constructor(uint256[LEN] memory _a) {
        a = _a;
    }
}

// ====
// compileViaYul: also
// ----
// constructor(): 1, 2, 3 ->
// gas Legacy: 195924
// gas LegacyOptimized: 168591
// gas Yul: 273504
// gas YulOptimized: 141035
// a(uint256): 0 -> 1
// gas Legacy: 22601
// gas LegacyOptimized: 22309
// gas Yul: 23327
// gas YulOptimized: 22202
// a(uint256): 1 -> 2
// gas Legacy: 22613
// gas LegacyOptimized: 22321
// gas Yul: 23339
// gas YulOptimized: 22214
// a(uint256): 2 -> 3
// gas Legacy: 22613
// gas LegacyOptimized: 22321
// gas Yul: 23339
// gas YulOptimized: 22214
