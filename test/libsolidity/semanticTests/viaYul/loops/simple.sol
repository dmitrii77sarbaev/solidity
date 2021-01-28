contract C {
    function f() public returns (uint x) {
        x = 1;
        for (uint a = 0; a < 10; a = a + 1) {
            x = x + x;
        }
    }
    function g() public returns (uint x) {
        x = 1;
        uint a = 0;
        while (a < 10) {
            x = x + x;
            a = a + 1;
        }
    }
    function h() public returns (uint x) {
        x = 1;
        do {
            x = x + 1;
        } while (false);
    }
    function i() public returns (uint x) {
        x = 1;
        do {
            x = x + 1;
        } while (x < 3);
    }
    function j() public {
        for (;;) {break;}
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1024
// gas Legacy: 25821
// gas LegacyOptimized: 23172
// gas Yul: 28984
// gas YulOptimized: 23736
// g() -> 1024
// gas Legacy: 25887
// gas LegacyOptimized: 23238
// gas Yul: 29050
// gas YulOptimized: 23802
// h() -> 2
// gas Legacy: 21642
// gas LegacyOptimized: 21389
// gas Yul: 22327
// gas YulOptimized: 21686
// i() -> 3
// gas Legacy: 21917
// gas LegacyOptimized: 21554
// gas Yul: 23023
// gas YulOptimized: 21993
// j() ->
// gas Legacy: 21208
// gas LegacyOptimized: 21208
// gas Yul: 21640
// gas YulOptimized: 21383
