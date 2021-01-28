pragma abicoder v2;

contract C {
    function f(uint a, bytes memory b, uint c)
            public pure returns (uint, uint, bytes1, uint) {
        return (a, b.length, b[3], c);
    }

    function f_external(uint a, bytes calldata b, uint c)
            external pure returns (uint, uint, bytes1, uint) {
        return (a, b.length, b[3], c);
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256,bytes,uint256): 6, 0x60, 9, 7, "abcdefg" -> 6, 7, "d", 9
// gas Legacy: 23714
// gas LegacyOptimized: 22706
// gas Yul: 24454
// gas YulOptimized: 22923
// f_external(uint256,bytes,uint256): 6, 0x60, 9, 7, "abcdefg" -> 6, 7, "d", 9
// gas Legacy: 23238
// gas LegacyOptimized: 22533
// gas Yul: 23876
// gas YulOptimized: 22583
