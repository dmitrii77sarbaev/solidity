contract test {
    uint256 public data;
    constructor() {
        data = 8;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// data() -> 8
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
