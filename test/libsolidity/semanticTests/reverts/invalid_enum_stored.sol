contract C {
    enum X {A, B}
    X public x;

    function test_store() public returns (uint256) {
        X garbled = X.A;
        assembly {
            garbled := 5
        }
        x = garbled;
        return 1;
    }

    function test_store_ok() public returns (uint256) {
        x = X.A;
        return 1;
    }
}
// ====
// EVMVersion: >=byzantium
// compileToEwasm: also
// compileViaYul: also
// ----
// test_store_ok() -> 1
// gas Legacy: 23088
// gas LegacyOptimized: 22910
// gas Yul: 23839
// gas YulOptimized: 23194
// x() -> 0
// gas Legacy: 22299
// gas LegacyOptimized: 22102
// gas Yul: 22831
// gas YulOptimized: 22275
// test_store() -> FAILURE, hex"4e487b71", 33 # should throw #
// gas Legacy: 22140
// gas LegacyOptimized: 22090
// gas Yul: 21558
// gas YulOptimized: 21373
