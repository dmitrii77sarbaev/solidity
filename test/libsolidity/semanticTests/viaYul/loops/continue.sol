contract C {
    function f() public returns (uint x) {
        x = 1;
        uint a = 0;
        for (; a < 10; a = a + 1) {
            continue;
            x = x + x;
        }
        x = x + a;
    }
    function g() public returns (uint x) {
        x = 1;
        uint a = 0;
        while (a < 10) {
            a = a + 1;
            continue;
            x = x + x;
        }
        x = x + a;
    }
    function h() public returns (uint x) {
        x = 1;
        uint a = 0;
        do {
            a = a + 1;
            continue;
            x = x + x;
        } while (a < 4);
        x = x + a;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 11
// gas Legacy: 24003
// gas LegacyOptimized: 22497
// gas Yul: 26396
// gas YulOptimized: 23002
// g() -> 11
// gas Legacy: 24047
// gas LegacyOptimized: 22541
// gas Yul: 26440
// gas YulOptimized: 23046
// h() -> 5
// gas Legacy: 22508
// gas LegacyOptimized: 21764
// gas Yul: 23972
// gas YulOptimized: 22430
