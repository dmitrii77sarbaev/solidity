library A {
    function f() internal returns (uint256) {
        return 1;
    }
}


contract B {
    function f() internal returns (uint256) {
        return 2;
    }

    function g() public returns (uint256) {
        return A.f();
    }
}

// ====
// compileViaYul: also
// ----
// g() -> 1
// gas Legacy: 21414
// gas LegacyOptimized: 21305
// gas Yul: 21928
// gas YulOptimized: 21229
