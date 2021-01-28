contract C {
    function f() public returns (uint x) {
        x = 1;
        for (uint a = 0; a < 10; a = a + 1) {
            x = x + x;
            break;
        }
    }
    function g() public returns (uint x) {
        x = 1;
        uint a = 0;
        while (a < 10) {
            x = x + x;
            break;
            a = a + 1;
        }
    }
    function h() public returns (uint x) {
        x = 1;
        do {
            x = x + 1;
            break;
        } while (x < 3);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 21612
// gas LegacyOptimized: 21350
// gas Yul: 22337
// gas YulOptimized: 21524
// g() -> 2
// gas Legacy: 21656
// gas LegacyOptimized: 21394
// gas Yul: 22381
// gas YulOptimized: 21568
// h() -> 2
// gas Legacy: 21603
// gas LegacyOptimized: 21367
// gas Yul: 22229
// gas YulOptimized: 21546
