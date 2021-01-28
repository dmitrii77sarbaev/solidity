contract A {
    uint x;
    constructor() {
        x = 42;
    }
    function f() public returns(uint256) {
        return x;
    }
}
contract B is A {
    uint public y = f();
}
// ====
// compileToEwasm: also
// compileViaYul: true
// ----
// constructor() ->
// gas Yul: 232112
// gas YulOptimized: 153851
// y() -> 42
// gas Yul: 22744
// gas YulOptimized: 22262
