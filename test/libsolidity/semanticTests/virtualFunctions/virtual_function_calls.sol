contract Base {
    function f() public returns (uint256 i) {
        return g();
    }

    function g() public virtual returns (uint256 i) {
        return 1;
    }
}


contract Derived is Base {
    function g() public override returns (uint256 i) {
        return 2;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 2
// gas Legacy: 21401
// gas LegacyOptimized: 21292
// gas Yul: 21871
// gas YulOptimized: 21427
// f() -> 2
// gas Legacy: 21414
// gas LegacyOptimized: 21305
// gas Yul: 21929
// gas YulOptimized: 21344
