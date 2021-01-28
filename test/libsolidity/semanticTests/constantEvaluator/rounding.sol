contract C {
    int constant a = 7;
    int constant b = 3;
    int constant c = a / b;
    int constant d = (-a) / b;
    function f() public pure returns (uint, int, uint, int) {
        uint[c] memory x;
        uint[-d] memory y;
        return (x.length, c, y.length, -d);
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 2, 2, 2, 2
// gas Legacy: 22661
// gas LegacyOptimized: 21940
// gas Yul: 26086
// gas YulOptimized: 22936
