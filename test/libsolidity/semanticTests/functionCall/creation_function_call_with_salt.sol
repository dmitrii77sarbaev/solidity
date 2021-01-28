contract C {
    uint public i;
    constructor(uint newI) {
        i = newI;
    }
}
contract D {
    C c;
    constructor(uint v) {
        c = new C{salt: "abc"}(v);
    }
    function f() public returns (uint r) {
        return c.i();
    }
}
// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// constructor(): 2 ->
// gas Legacy: 284970
// gas LegacyOptimized: 242279
// gas Yul: 400381
// gas YulOptimized: 214833
// f() -> 2
// gas Legacy: 25144
// gas LegacyOptimized: 24804
// gas Yul: 26636
// gas YulOptimized: 24890
