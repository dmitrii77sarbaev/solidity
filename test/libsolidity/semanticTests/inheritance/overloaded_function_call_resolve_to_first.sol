contract test {
    function f(uint256 k) public returns (uint256 d) {
        return k;
    }

    function f(uint256 a, uint256 b) public returns (uint256 d) {
        return a + b;
    }

    function g() public returns (uint256 d) {
        return f(3);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 3
// gas Legacy: 21466
// gas LegacyOptimized: 21349
// gas Yul: 21981
// gas YulOptimized: 21481
