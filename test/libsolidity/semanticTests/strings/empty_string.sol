contract C {
    function f() public pure returns (string memory) {
        return "";
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x20, 0
// gas Legacy: 21691
// gas LegacyOptimized: 21430
// gas Yul: 22546
// gas YulOptimized: 21599
