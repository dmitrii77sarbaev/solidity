contract C {
    function f(uint a) public pure returns (uint8 x) {
        uint8 b = uint8(a);
        x = b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 0x12345678 -> 0x78
// gas Legacy: 21839
// gas LegacyOptimized: 21532
// gas Yul: 22219
// gas YulOptimized: 21411
