contract C {
    uint[] data;

    function len() public returns (uint ret) {
        data.push(234);
        data.push(123);
        delete data;
        assembly {
            ret := sload(data.slot)
        }
    }

    function val() public returns (uint ret) {
        assembly {
            sstore(0, 2)
            mstore(0, 0)
            sstore(keccak256(0, 32), 234)
            sstore(add(keccak256(0, 32), 1), 123)
        }

        assert(data[0] == 234);
        assert(data[1] == 123);

        delete data;

        uint size = 999;

        assembly {
            size := sload(0)
            mstore(0, 0)
            ret := sload(keccak256(0, 32))
        }
    }
}

// ====
// compileViaYul: also
// ----
// len() -> 0
// gas Legacy: 88335
// gas LegacyOptimized: 88029
// gas Yul: 96260
// gas YulOptimized: 92026
// val() -> 0
// gas Legacy: 32453
// gas LegacyOptimized: 27980
// gas Yul: 36962
// gas YulOptimized: 31937
