contract A {
    uint immutable public x = 1;
    uint public y;
    constructor() {
        y = this.x();
    }
}
contract C {
    function f() public returns (bool) {
        try new A() { return false; }
        catch { return true; }
    }
}
// ====
// EVMVersion: >=tangerineWhistle
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 54477
// gas LegacyOptimized: 54353
// gas Yul: 55270
// gas YulOptimized: 54314
