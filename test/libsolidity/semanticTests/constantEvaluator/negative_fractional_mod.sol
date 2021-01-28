contract C {
    function f() public pure returns (int, int) {
        int x = int((-(-5.2 % 3)) * 5);
        int t = 5;
        return (x, (-(-t % 3)) * 5);
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 11, 10
// gas Legacy: 22354
// gas LegacyOptimized: 21830
// gas Yul: 23137
// gas YulOptimized: 21611
