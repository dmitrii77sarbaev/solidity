contract test {
    function f(uint256 a, uint256 b) public returns (uint256 d) {
        return a + b;
    }

    function f(uint256 k) public returns (uint256 d) {
        return k;
    }

    function g() public returns (uint256 d) {
        return f(3, 7);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 10
// gas Legacy: 21665
// gas LegacyOptimized: 21434
// gas Yul: 22273
// gas YulOptimized: 21568
