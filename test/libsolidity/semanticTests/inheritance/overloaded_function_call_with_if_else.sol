contract test {
    function f(uint256 a, uint256 b) public returns (uint256 d) {
        return a + b;
    }

    function f(uint256 k) public returns (uint256 d) {
        return k;
    }

    function g(bool flag) public returns (uint256 d) {
        if (flag) return f(3);
        else return f(3, 7);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g(bool): true -> 3
// gas Legacy: 21908
// gas LegacyOptimized: 21645
// gas Yul: 22348
// gas YulOptimized: 21763
// g(bool): false -> 10
// gas Legacy: 22085
// gas LegacyOptimized: 21710
// gas Yul: 22629
// gas YulOptimized: 21836
