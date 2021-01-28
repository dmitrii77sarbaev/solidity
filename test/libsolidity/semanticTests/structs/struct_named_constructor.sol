contract C {
    struct S {
        uint256 a;
        bool x;
    }
    S public s;

    constructor() {
        s = S({x: true, a: 1});
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// s() -> 1, true
// gas Legacy: 23139
// gas LegacyOptimized: 22903
// gas Yul: 23820
// gas YulOptimized: 22863
