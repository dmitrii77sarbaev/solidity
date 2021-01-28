contract C {
    enum X {A, B}

    function tested(X x) public returns (uint256) {
        return 1;
    }

    function test() public returns (uint256) {
        X garbled;

        assembly {
            garbled := 5
        }

        return this.tested(garbled);
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// test() -> FAILURE, hex"4e487b71", 33 # should throw #
// gas Legacy: 21460
// gas LegacyOptimized: 21340
// gas Yul: 22615
// gas YulOptimized: 22045
