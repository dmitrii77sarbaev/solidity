contract C {
    function f(int a, int b) public pure returns (int) {
        return a % b;
    }
    function g(bool _check) public pure returns (int) {
        int x = type(int).min;
        if (_check) {
            return x / -1;
        } else {
            unchecked { return x / -1; }
        }
    }
}

// ====
// compileViaYul: also
// ----
// f(int256,int256): 7, 5 -> 2
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(int256,int256): 7, -5 -> 2
// gas Legacy: 22650
// gas LegacyOptimized: 22091
// gas Yul: 22963
// gas YulOptimized: 22146
// f(int256,int256): -7, 5 -> -2
// gas Legacy: 22650
// gas LegacyOptimized: 22091
// gas Yul: 22963
// gas YulOptimized: 22146
// f(int256,int256): -7, 5 -> -2
// gas Legacy: 22650
// gas LegacyOptimized: 22091
// gas Yul: 22963
// gas YulOptimized: 22146
// f(int256,int256): -5, -5 -> 0
// gas Legacy: 23022
// gas LegacyOptimized: 22463
// gas Yul: 23335
// gas YulOptimized: 22518
// g(bool): true -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 21869
// gas LegacyOptimized: 21601
// gas Yul: 22051
// gas YulOptimized: 21527
// g(bool): false -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 21859
// gas LegacyOptimized: 21585
// gas Yul: 22425
// gas YulOptimized: 21736
