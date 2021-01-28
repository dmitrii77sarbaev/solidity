contract C {
    constructor() payable {}
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// constructor(), 27 wei ->
// gas Legacy: 75727
// gas LegacyOptimized: 75739
// gas Yul: 64274
// gas YulOptimized: 55458
