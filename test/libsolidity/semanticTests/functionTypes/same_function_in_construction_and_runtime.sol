contract C {
    uint256 public initial;

    constructor() {
        initial = double(2);
    }

    function double(uint256 _arg) public returns (uint256 _ret) {
        _ret = _arg * 2;
    }

    function runtime(uint256 _arg) public returns (uint256) {
        return double(_arg);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// runtime(uint256): 3 -> 6
// gas Legacy: 22037
// gas LegacyOptimized: 21626
// gas Yul: 22470
// gas YulOptimized: 21698
// initial() -> 4
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22262
