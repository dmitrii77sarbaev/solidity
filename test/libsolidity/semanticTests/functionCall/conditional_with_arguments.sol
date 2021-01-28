contract C {
    function g(int x, int y) public pure returns (int) { return x - y; }
    function h(int y, int x) public pure returns (int) { return y - x; }

    function f() public pure returns (int) {
        return (false ? g : h)(2, 1);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 21714
// gas LegacyOptimized: 21469
// gas Yul: 22450
// gas YulOptimized: 21603
