contract C {
    uint public i = 1;
    uint public k = 2;

    constructor() {
        i = i + i;
        k = k - i;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// i() -> 2
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22262
// k() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22208
