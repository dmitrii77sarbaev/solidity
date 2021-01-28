contract C {
    function _() public pure returns (uint) {
        return 88;
    }

    function g() public pure returns (uint){
        return _();
    }

    function h() public pure returns (uint) {
        _;
        return 33;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// _() -> 88
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21849
// gas YulOptimized: 21437
// g() -> 88
// gas Legacy: 21458
// gas LegacyOptimized: 21349
// gas Yul: 21973
// gas YulOptimized: 21481
// h() -> 33
// gas Legacy: 21401
// gas LegacyOptimized: 21292
// gas Yul: 21871
// gas YulOptimized: 21459
