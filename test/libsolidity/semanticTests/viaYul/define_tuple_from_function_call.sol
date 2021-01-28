contract C {
    function f() public pure returns (uint, uint, uint) {
        return (1, 2, 3);
    }
    function g() public pure returns (uint x, uint y, uint z) {
        (uint c, uint b, uint a) = f();
        (x, y, z) = (a, b, c);
    }
    function h() public pure returns (uint) {
        (,,uint a) = f();
        return a;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 3, 2, 1
// gas Legacy: 21762
// gas LegacyOptimized: 21443
// gas Yul: 22450
// gas YulOptimized: 21594
// h() -> 3
// gas Legacy: 21481
// gas LegacyOptimized: 21348
// gas Yul: 22180
// gas YulOptimized: 21531
