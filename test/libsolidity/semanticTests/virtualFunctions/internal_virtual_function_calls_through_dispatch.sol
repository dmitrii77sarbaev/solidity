contract Base {
    function f() internal returns (uint256 i) {
        function() internal returns (uint256) ptr = g;
        return ptr();
    }

    function g() internal virtual returns (uint256 i) {
        return 1;
    }
}


contract Derived is Base {
    function g() internal override returns (uint256 i) {
        return 2;
    }

    function h() public returns (uint256 i) {
        return f();
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// h() -> 2
// gas Legacy: 21468
// gas LegacyOptimized: 21351
// gas Yul: 22081
// gas YulOptimized: 21229
