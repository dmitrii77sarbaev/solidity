contract C {
    function f() public pure returns(bytes memory) {
        return hex"12_34_5678_9A";
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 32, 5, left(0x123456789A)
// gas Legacy: 21805
// gas LegacyOptimized: 21560
// gas Yul: 22703
// gas YulOptimized: 21738
