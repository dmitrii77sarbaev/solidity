contract test {
    function x() public returns (uint) { return 1; }
    function y() public returns (uint) { return 2; }

    function f(bool cond) public returns (uint) {
        function () returns (uint) z = cond ? x : y;
        return z();
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> 1
// gas Legacy: 21884
// gas LegacyOptimized: 21617
// gas Yul: 22416
// gas YulOptimized: 21808
// f(bool): false -> 2
// gas Legacy: 21882
// gas LegacyOptimized: 21615
// gas Yul: 22405
// gas YulOptimized: 21797
