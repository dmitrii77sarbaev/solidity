contract Test {
    function test() public returns (uint ret) { return uint(uint160(address(uint160(uint128(type(uint200).max))))); }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() -> 0xffffffffffffffffffffffffffffffff
// gas Legacy: 21391
// gas LegacyOptimized: 21270
// gas Yul: 22366
// gas YulOptimized: 21229
