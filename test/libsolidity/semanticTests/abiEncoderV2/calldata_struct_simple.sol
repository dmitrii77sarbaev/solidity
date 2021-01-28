pragma abicoder               v2;

contract C {
    struct S { uint256 a; }

    function f(S calldata s) external returns (bytes memory) {
        return abi.encode(s);
    }

    function g(S calldata s) external returns (bytes memory) {
        return this.f(s);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f((uint256)): 3 -> 32, 32, 3
// gas Legacy: 22560
// gas LegacyOptimized: 21864
// gas Yul: 23042
// gas YulOptimized: 22083
// g((uint256)): 3 -> 32, 32, 3
// gas Legacy: 26328
// gas LegacyOptimized: 24572
// gas Yul: 27452
// gas YulOptimized: 25016
