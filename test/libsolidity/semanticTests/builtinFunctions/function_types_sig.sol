contract C {
    uint256 public x;

    function f() public pure returns (bytes4) {
        return this.f.selector;
    }

    function g() public returns (bytes4) {
        function () pure external returns (bytes4) fun = this.f;
        return fun.selector;
    }

    function h() public returns (bytes4) {
        function () pure external returns (bytes4) fun = this.f;
        return fun.selector;
    }

    function i() public pure returns (bytes4) {
        return this.x.selector;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x26121ff000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21413
// gas LegacyOptimized: 21325
// gas Yul: 21939
// gas YulOptimized: 21480
// g() -> 0x26121ff000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21496
// gas LegacyOptimized: 21369
// gas Yul: 21983
// gas YulOptimized: 21524
// h() -> 0x26121ff000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21474
// gas LegacyOptimized: 21347
// gas Yul: 21961
// gas YulOptimized: 21502
// i() -> 0x0c55699c00000000000000000000000000000000000000000000000000000000
// gas Legacy: 21479
// gas LegacyOptimized: 21391
// gas Yul: 22005
// gas YulOptimized: 21546
