library Arst {
    enum Foo {Things, Stuff}
}


contract Tsra {
    function f() public returns (uint256) {
        Arst.Foo;
        return 1;
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21848
// gas YulOptimized: 21229
