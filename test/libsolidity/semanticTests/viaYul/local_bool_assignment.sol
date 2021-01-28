contract C {
    function f(bool a) public pure returns (bool x) {
        bool b = a;
        x = b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> true
// gas Legacy: 21809
// gas LegacyOptimized: 21524
// gas Yul: 22095
// gas YulOptimized: 21417
