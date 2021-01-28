contract E {}

library L {
    function foo(E e) internal pure returns (uint) {
        return 42;
    }
}

contract C {
    using L for E;

    function test() public returns (uint) {
        E e = new E();
        return e.foo();
    }
}

// ====
// compileViaYul: also
// ----
// test() -> 42
// gas Legacy: 74443
// gas LegacyOptimized: 74343
// gas Yul: 64415
// gas YulOptimized: 55569
