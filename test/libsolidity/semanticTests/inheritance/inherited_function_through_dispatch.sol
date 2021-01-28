contract A {
    function f() internal virtual returns (uint256) {
        return 1;
    }
}


contract B is A {
    function f() internal override returns (uint256) {
        return 2;
    }

    function g() public returns (uint256) {
        function() internal returns (uint256) ptr = A.f;
        return ptr();
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 1
// gas Legacy: 21433
// gas LegacyOptimized: 21316
// gas Yul: 22001
// gas YulOptimized: 21229
