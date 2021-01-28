contract C {
    enum X {A, B}

    function test_return() public returns (X) {
        X garbled;
        assembly {
            garbled := 5
        }
        return garbled;
    }

    function test_inline_assignment() public returns (X _ret) {
        assembly {
            _ret := 5
        }
    }

    function test_assignment() public returns (X _ret) {
        X tmp;
        assembly {
            tmp := 5
        }
        _ret = tmp;
    }
}

// ====
// EVMVersion: >=byzantium
// compileToEwasm: also
// compileViaYul: also
// ----
// test_return() -> FAILURE, hex"4e487b71", 33 # both should throw #
// gas Legacy: 21435
// gas LegacyOptimized: 21302
// gas Yul: 21846
// gas YulOptimized: 21476
// test_inline_assignment() -> FAILURE, hex"4e487b71", 33
// gas Legacy: 21400
// gas LegacyOptimized: 21280
// gas Yul: 21803
// gas YulOptimized: 21454
// test_assignment() -> FAILURE, hex"4e487b71", 33
// gas Legacy: 21457
// gas LegacyOptimized: 21324
// gas Yul: 21868
// gas YulOptimized: 21498
