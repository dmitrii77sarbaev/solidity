contract c {
    function f() public returns (int8) {
        int8[5] memory foo3 = [int8(1), -1, 0, 0, 0];
        return foo3[0];
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 21595
// gas LegacyOptimized: 21413
// gas Yul: 23461
// gas YulOptimized: 21641
