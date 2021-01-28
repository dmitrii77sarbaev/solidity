contract C {
    uint256 v;

    function f() public returns (bool) {
        uint256 startGas = gasleft();
        v++;
        assert(startGas > gasleft());
        return true;
    }

    function g() public returns (bool) {
        uint256 startGas = gasleft();
        assert(startGas > gasleft());
        return true;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 42379
// gas LegacyOptimized: 42210
// gas Yul: 44147
// gas YulOptimized: 42319
// g() -> true
// gas Legacy: 21441
// gas LegacyOptimized: 21340
// gas Yul: 21939
// gas YulOptimized: 21566
