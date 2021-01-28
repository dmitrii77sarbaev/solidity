contract C {
    function f() public pure returns (uint, uint, uint) {
        return (1, 2, 3);
    }
    function g() public pure returns (uint a, uint b, uint c) {
        (c, b, a) = f();
    }
    function h() public pure returns (uint a) {
        (,,a) = f();
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 3, 2, 1
// gas Legacy: 21723
// gas LegacyOptimized: 21428
// gas Yul: 22450
// gas YulOptimized: 21594
// h() -> 3
// gas Legacy: 21482
// gas LegacyOptimized: 21343
// gas Yul: 22322
// gas YulOptimized: 21531
