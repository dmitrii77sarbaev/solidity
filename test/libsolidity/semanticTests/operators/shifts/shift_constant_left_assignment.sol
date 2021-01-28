contract C {
    function f() public returns (uint256 a) {
        a = 0x42;
        a <<= 8;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x4200
// gas Legacy: 21396
// gas LegacyOptimized: 21270
// gas Yul: 22156
// gas YulOptimized: 21229
