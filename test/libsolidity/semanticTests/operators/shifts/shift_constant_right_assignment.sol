contract C {
    function f() public returns (uint256 a) {
        a = 0x4200;
        a >>= 8;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x42
// gas Legacy: 21396
// gas LegacyOptimized: 21270
// gas Yul: 22200
// gas YulOptimized: 21229
