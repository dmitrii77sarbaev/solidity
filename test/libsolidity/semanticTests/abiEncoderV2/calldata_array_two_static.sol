pragma abicoder               v2;

contract C {
    function f(uint256[3] calldata s1, uint256[2] calldata s2, bool which) external pure returns (bytes memory) {
        if (which)
            return abi.encode(s1);
        else
            return abi.encode(s2);
    }
    function g(uint256[3] calldata s1, uint256[2] calldata s2, bool which) external view returns (bytes memory) {
        return this.f(s1, s2, which);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256[3],uint256[2],bool): 23, 42, 87, 51, 72, true -> 32, 96, 23, 42, 87
// gas Legacy: 23491
// gas LegacyOptimized: 22891
// gas Yul: 23991
// gas YulOptimized: 23107
// f(uint256[3],uint256[2],bool): 23, 42, 87, 51, 72, false -> 32, 64, 51, 72
// gas Legacy: 23385
// gas LegacyOptimized: 22804
// gas Yul: 23895
// gas YulOptimized: 23011
// g(uint256[3],uint256[2],bool): 23, 42, 87, 51, 72, true -> 32, 96, 23, 42, 87
// gas Legacy: 27888
// gas LegacyOptimized: 26147
// gas Yul: 29041
// gas YulOptimized: 26624
// g(uint256[3],uint256[2],bool): 23, 42, 87, 51, 72, false -> 32, 64, 51, 72
// gas Legacy: 27620
// gas LegacyOptimized: 25914
// gas Yul: 28781
// gas YulOptimized: 26364
