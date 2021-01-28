contract C {
    uint public i;
    constructor(uint newI) {
        i = newI;
    }
}
contract D {
    C c;
    constructor(uint v) {
        c = new C(v);
    }
    function f() public returns (uint r) {
        return c.i();
    }
}
// ====
// compileViaYul: also
// ----
// constructor(): 2 ->
// gas Legacy: 284580
// gas LegacyOptimized: 242023
// gas Yul: 399719
// gas YulOptimized: 214602
// f() -> 2
// gas Legacy: 25144
// gas LegacyOptimized: 24804
// gas Yul: 26636
// gas YulOptimized: 24890
