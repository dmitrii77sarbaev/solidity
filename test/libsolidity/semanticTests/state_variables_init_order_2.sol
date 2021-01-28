contract A {
    uint public x = 0;
    uint y = f();
    function f() public returns (uint256) {
        ++x;
        return 42;
    }
}
contract B is A {
    uint public z;
    constructor() {
        z = x;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// z() -> 1
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22284
