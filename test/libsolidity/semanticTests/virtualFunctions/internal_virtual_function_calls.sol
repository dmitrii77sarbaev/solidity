contract Base {
    function f() public returns (uint256 i) {
        return g();
    }

    function g() internal virtual returns (uint256 i) {
        return 1;
    }
}


contract Derived is Base {
    function g() internal override returns (uint256 i) {
        return 2;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 21414
// gas LegacyOptimized: 21305
// gas Yul: 21928
// gas YulOptimized: 21229
