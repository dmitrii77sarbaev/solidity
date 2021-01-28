contract C {
    function g(bool x) external pure {
        require(x);
    }
    function f(bool x) public returns (uint) {
        try this.g(x) {
            return 1;
        } catch {
            return 2;
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// f(bool): true -> 1
// gas Legacy: 23927
// gas LegacyOptimized: 23409
// gas Yul: 25127
// gas YulOptimized: 23694
// f(bool): false -> 2
// gas Legacy: 23914
// gas LegacyOptimized: 23396
// gas Yul: 24591
// gas YulOptimized: 23422
