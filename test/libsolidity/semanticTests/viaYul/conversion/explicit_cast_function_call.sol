contract C {
    function f(bytes32 b) public pure returns (bytes32 x) {
        x = b;
    }
    function g() public pure returns (bytes32 x) {
        x = f(bytes4(uint32(0x12345678)));
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 0x1234567800000000000000000000000000000000000000000000000000000000
// gas Legacy: 21459
// gas LegacyOptimized: 21333
// gas Yul: 22209
// gas YulOptimized: 21465
