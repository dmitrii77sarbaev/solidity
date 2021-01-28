contract Test {
    int16[] public x = [-1, -2];
    int16[2] public y = [-5, -6];
    int16 z;
    function f() public returns (int16[] memory) {
        int8[] memory t = new int8[](2);
        t[0] = -3;
        t[1] = -4;
        x = t;
        return x;
    }
    function g() public returns (int16[2] memory) {
        int8[2] memory t = [-3, -4];
        y = t;
        return y;
    }
    function h(int8 t) public returns (int16) {
        z = t;
        return z;
    }
}
// ====
// compileViaYul: also
// ----
// x(uint256): 0 -> -1
// gas Legacy: 23545
// gas LegacyOptimized: 23267
// gas Yul: 25038
// gas YulOptimized: 23421
// x(uint256): 1 -> -2
// gas Legacy: 23607
// gas LegacyOptimized: 23329
// gas Yul: 25050
// gas YulOptimized: 23433
// y(uint256): 0 -> -5
// gas Legacy: 22713
// gas LegacyOptimized: 22435
// gas Yul: 23404
// gas YulOptimized: 22590
// y(uint256): 1 -> -6
// gas Legacy: 22775
// gas LegacyOptimized: 22497
// gas Yul: 23416
// gas YulOptimized: 22602
// f() -> 0x20, 2, -3, -4
// gas Legacy: 56499
// gas LegacyOptimized: 55865
// gas Yul: 33871
// gas YulOptimized: 30427
// g() -> -3, -4
// gas Legacy: 52981
// gas LegacyOptimized: 52235
// gas Yul: 30883
// gas YulOptimized: 26925
// h(int8): -10 -> -10
// gas Legacy: 43981
// gas LegacyOptimized: 42875
// gas Yul: 44768
// gas YulOptimized: 43053
