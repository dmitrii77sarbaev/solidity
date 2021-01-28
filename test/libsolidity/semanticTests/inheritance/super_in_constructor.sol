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
    uint256 data;

    constructor() {
        data = super.f() | 8;
    }

    function f() public override (B, C) returns (uint256 r) {
        return data;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 15
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22742
// gas YulOptimized: 22034
