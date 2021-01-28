contract X {
    function f() public returns (uint x) {
        x = g();
    }
    function g() public virtual returns (uint x) {
        x = 2;
    }
}
contract C is X {
    function f1() public returns (uint x) {
        // direct call
        x = g();
    }
    function f2() public returns (uint x) {
        // call via base
        x = f();
    }
    function f3() public returns (uint x) {
        // explicit call via base
        //x = super.g();
    }
    function g() public override returns (uint x) {
        x = 3;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 3
// gas Legacy: 21414
// gas LegacyOptimized: 21305
// gas Yul: 21929
// gas YulOptimized: 21440
// f1() -> 3
// gas Legacy: 21480
// gas LegacyOptimized: 21371
// gas Yul: 21995
// gas YulOptimized: 21506
// f2() -> 3
// gas Legacy: 21471
// gas LegacyOptimized: 21362
// gas Yul: 22031
// gas YulOptimized: 21462
// g() -> 3
// gas Legacy: 21467
// gas LegacyOptimized: 21358
// gas Yul: 21937
// gas YulOptimized: 21528
