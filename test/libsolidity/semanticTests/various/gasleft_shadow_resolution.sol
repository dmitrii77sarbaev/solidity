contract C {
    function gasleft() public returns (uint256) {
        return 0;
    }

    function f() public returns (uint256) {
        return gasleft();
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0
// gas Legacy: 21406
// gas LegacyOptimized: 21305
// gas Yul: 21929
// gas YulOptimized: 21344
