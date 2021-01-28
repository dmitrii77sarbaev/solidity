contract C {
    function f() public returns (uint id) {
        assembly {
            id := chainid()
        }
    }
}
// ====
// EVMVersion: >=istanbul
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
