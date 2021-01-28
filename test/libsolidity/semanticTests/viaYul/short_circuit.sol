contract C {
    function or(uint x) public returns (bool t, uint y) {
        t = (x == 0 || ((x = 8) > 0));
        y = x;
    }
    function and(uint x) public returns (bool t, uint y) {
        t = (x == 0 && ((x = 8) > 0));
        y = x;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// or(uint256): 0 -> true, 0
// gas Legacy: 21912
// gas LegacyOptimized: 21532
// gas Yul: 22401
// gas YulOptimized: 21597
// and(uint256): 0 -> true, 8
// gas Legacy: 21956
// gas LegacyOptimized: 21569
// gas Yul: 22667
// gas YulOptimized: 21735
// or(uint256): 1 -> true, 8
// gas Legacy: 21943
// gas LegacyOptimized: 21557
// gas Yul: 22660
// gas YulOptimized: 21625
// and(uint256): 1 -> false, 1
// gas Legacy: 21949
// gas LegacyOptimized: 21569
// gas Yul: 22432
// gas YulOptimized: 21731
