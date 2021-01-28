contract C {
    function foo() internal returns (uint) {
        return 42;
    }

    function get_ptr(function() internal returns (uint) ptr) internal returns(function() internal returns (uint)) {
        return ptr;
    }

    function associated() public returns (uint) {
        // This expression directly references function definition
        return (foo)();
    }

    function unassociated() public returns (uint) {
        // This expression is not associated with a specific function definition
        return (get_ptr(foo))();
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// associated() -> 42
// gas Legacy: 21414
// gas LegacyOptimized: 21305
// gas Yul: 22002
// gas YulOptimized: 21481
// unassociated() -> 42
// gas Legacy: 21485
// gas LegacyOptimized: 21360
// gas Yul: 22112
// gas YulOptimized: 21535
