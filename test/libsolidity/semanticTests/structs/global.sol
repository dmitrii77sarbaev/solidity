pragma abicoder               v2;

struct S { uint256 a; uint256 b; }
contract C {
    function f(S calldata s) external pure returns (uint256, uint256) {
        return (s.a, s.b);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f((uint256,uint256)): 42, 23 -> 42, 23
// gas Legacy: 21987
// gas LegacyOptimized: 21662
// gas Yul: 22602
// gas YulOptimized: 21524
