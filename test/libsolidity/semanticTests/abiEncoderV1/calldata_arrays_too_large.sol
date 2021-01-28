contract C {
    function f(uint a, uint[] calldata b, uint c) external pure returns (uint) {
        return 7;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256[],uint256): 6, 0x60, 9, 0x8000000000000000000000000000000000000000000000000000000000000002, 1, 2 -> FAILURE
// gas Legacy: 22409
// gas LegacyOptimized: 22213
// gas Yul: 22439
// gas YulOptimized: 22163
