contract A {
    function f() external virtual returns (uint256) {
        return 1;
    }
}


contract B is A {
    function f() public override returns (uint256) {
        return 2;
    }

    function g() public returns (uint256) {
        return f();
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21849
// gas YulOptimized: 21344
// g() -> 2
// gas Legacy: 21436
// gas LegacyOptimized: 21327
// gas Yul: 21951
// gas YulOptimized: 21427
