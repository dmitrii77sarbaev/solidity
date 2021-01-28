contract A {
    function f() public {
        new B();
    }
}


contract B {
    function f() public {}
}


contract C {
    function f() public {
        new B();
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// constructor() ->
// gas Legacy: 135639
// gas LegacyOptimized: 135651
// gas Yul: 204030
// gas YulOptimized: 124731
