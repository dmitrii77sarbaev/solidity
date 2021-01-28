contract C {
    function f() public returns (uint x) {
        x = 1;
        uint a;
        for (; a < 10; a = a + 1) {
            return x;
            x = x + x;
        }
        x = x + a;
    }
    function g() public returns (uint x) {
        x = 1;
        uint a;
        while (a < 10) {
            return x;
            x = x + x;
            a = a + 1;
        }
        x = x + a;
    }
    function h() public returns (uint x) {
        x = 1;
        do {
            x = x + 1;
            return x;
        } while (x < 3);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 21421
// gas LegacyOptimized: 21270
// gas Yul: 22098
// gas YulOptimized: 21437
// g() -> 1
// gas Legacy: 21465
// gas LegacyOptimized: 21314
// gas Yul: 22142
// gas YulOptimized: 21481
// h() -> 2
// gas Legacy: 21603
// gas LegacyOptimized: 21367
// gas Yul: 22236
// gas YulOptimized: 21608
