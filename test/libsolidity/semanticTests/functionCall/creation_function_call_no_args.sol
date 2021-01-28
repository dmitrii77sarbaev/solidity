contract C {
    uint public i;
    constructor() {
        i = 2;
    }
}
contract D {
    function f() public returns (uint r) {
        return new C().i();
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 120563
// gas LegacyOptimized: 112385
// gas Yul: 164920
// gas YulOptimized: 92351
