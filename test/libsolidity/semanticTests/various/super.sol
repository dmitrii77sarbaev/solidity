contract A {
    function f() public virtual returns (uint256 r) {
        return 1;
    }
}


contract B is A {
    function f() public virtual override returns (uint256 r) {
        return super.f() | 2;
    }
}


contract C is A {
    function f() public virtual override returns (uint256 r) {
        return super.f() | 4;
    }
}


contract D is B, C {
    function f() public override(B, C) returns (uint256 r) {
        return super.f() | 8;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 15
// gas Legacy: 21502
// gas LegacyOptimized: 21393
// gas Yul: 22385
// gas YulOptimized: 21229
