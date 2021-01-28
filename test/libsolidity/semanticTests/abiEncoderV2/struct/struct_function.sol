pragma abicoder               v2;

contract C {
    struct S { function () external returns (uint) f; uint b; }
    function f(S memory s) public returns (uint, uint) {
        return (s.f(), s.b);
    }
    function test() public returns (uint, uint) {
        return this.f(S(this.g, 3));
    }
    function g() public returns (uint) { return 7; }
}
// ====
// compileViaYul: also
// ----
// test() -> 7, 3
// gas Legacy: 27439
// gas LegacyOptimized: 25605
// gas Yul: 30221
// gas YulOptimized: 26440
