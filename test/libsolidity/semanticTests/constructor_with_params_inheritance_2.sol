contract C {
    uint public i;
    uint public k;

    constructor(uint newI, uint newK) {
        i = newI;
        k = newK;
    }
}
contract D is C(2, 1) {}
// ====
// compileViaYul: also
// ----
// i() -> 2
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22262
// k() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22208
