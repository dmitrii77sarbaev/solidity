pragma abicoder               v2;

contract C {
    struct S { uint256[] a; }
    function f(S[] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(S[] calldata s) external view returns (bytes memory) {
        return this.f(s);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f((uint256[])[]): 32, 1, 32, 32, 3, 17, 42, 23 -> 32, 256, 32, 1, 32, 32, 3, 17, 42, 23
// gas Legacy: 25012
// gas LegacyOptimized: 24076
// gas Yul: 25544
// gas YulOptimized: 24472
// g((uint256[])[]): 32, 1, 32, 32, 3, 17, 42, 23 -> 32, 256, 32, 1, 32, 32, 3, 17, 42, 23
// gas Legacy: 30817
// gas LegacyOptimized: 28525
// gas Yul: 32048
// gas YulOptimized: 29298
