contract C {
    enum X {A, B}

    function test_eq() public returns (bool) {
        X garbled;
        assembly {
            garbled := 5
        }
        return garbled == garbled;
    }

    function test_eq_ok() public returns (bool) {
        X garbled = X.A;
        return garbled == garbled;
    }

    function test_neq() public returns (bool) {
        X garbled;
        assembly {
            garbled := 5
        }
        return garbled != garbled;
    }
}
// ====
// EVMVersion: >=byzantium
// compileToEwasm: also
// compileViaYul: also
// ----
// test_eq_ok() -> 1
// gas Legacy: 21500
// gas LegacyOptimized: 21377
// gas Yul: 22023
// gas YulOptimized: 21605
// test_eq() -> FAILURE, hex"4e487b71", 33 # both should throw #
// gas Legacy: 21243
// gas LegacyOptimized: 21216
// gas Yul: 21510
// gas YulOptimized: 21308
// test_neq() -> FAILURE, hex"4e487b71", 33
// gas Legacy: 21265
// gas LegacyOptimized: 21238
// gas Yul: 21532
// gas YulOptimized: 21330
