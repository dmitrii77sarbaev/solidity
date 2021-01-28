contract C {
    string public tester;

    function f() public returns (string memory) {
        return (["abc", "def", "g"][0]);
    }

    function test() public {
        tester = f();
    }
}

// ====
// compileViaYul: also
// ----
// test() ->
// gas Legacy: 42769
// gas LegacyOptimized: 42741
// gas Yul: 45608
// gas YulOptimized: 43591
// tester() -> 0x20, 0x3, "abc"
// gas Legacy: 24619
// gas LegacyOptimized: 24359
// gas Yul: 23620
// gas YulOptimized: 22970
