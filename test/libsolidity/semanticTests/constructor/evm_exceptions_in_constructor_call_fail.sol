contract A {
    constructor() {
        address(this).call("123");
    }
}


contract B {
    uint256 public test = 1;

    function testIt() public {
        A a = new A();
        ++test;
    }
}

// ====
// compileViaYul: also
// ----
// testIt() ->
// gas Legacy: 77008
// gas LegacyOptimized: 76768
// gas Yul: 68471
// gas YulOptimized: 57940
// test() -> 2
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22262
