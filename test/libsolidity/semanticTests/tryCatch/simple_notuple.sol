contract C {
    function g(bool b) public pure returns (uint x) {
        require(b);
        return 13;
    }
    function f(bool flag) public view returns (uint x) {
        try this.g(flag) returns (uint a) {
            x = a;
        } catch {
            x = 9;
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// f(bool): true -> 13
// gas Legacy: 24417
// gas LegacyOptimized: 23632
// gas Yul: 25471
// gas YulOptimized: 23927
// f(bool): false -> 9
// gas Legacy: 23917
// gas LegacyOptimized: 23399
// gas Yul: 24645
// gas YulOptimized: 23521
