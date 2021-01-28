contract C {
    bytes32 constant x = keccak256("abc");

    function f() public returns (bytes32) {
        return x;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x4e03657aea45a94fc7d47ba826c8d667c0d1e6e33a64a036ec44f58fa12d6c45
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21796
// gas YulOptimized: 21229
