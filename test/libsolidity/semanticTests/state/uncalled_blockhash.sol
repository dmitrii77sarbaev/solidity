contract C {
    function f() public returns (bytes32) {
        return (blockhash)(block.number - 1);
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x3737373737373737373737373737373737373737373737373737373737373738
// gas Legacy: 21586
// gas LegacyOptimized: 21361
// gas Yul: 22052
// gas YulOptimized: 21457
