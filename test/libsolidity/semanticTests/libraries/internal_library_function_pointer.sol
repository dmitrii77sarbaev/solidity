library L {
    function f() internal returns (uint) {
        return 66;
    }
}

contract C {
    function g() public returns (uint) {
        function() internal returns(uint) ptr;
        ptr = L.f;
        return ptr();
    }
}
// ====
// compileViaYul: also
// ----
// g() -> 66
// gas Legacy: 21433
// gas LegacyOptimized: 21316
// gas Yul: 22058
// gas YulOptimized: 21229
