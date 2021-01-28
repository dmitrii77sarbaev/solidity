pragma abicoder               v2;


contract C {
    struct S {
        uint8 a;
        bytes1 b;
    }

    function f(S calldata s) external pure returns (uint256 a, bytes32 b) {
        uint8 tmp1 = s.a;
        bytes1 tmp2 = s.b;
        assembly {
            a := tmp1
            b := tmp2
        }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f((uint8,bytes1)): 0x12, hex"3400000000000000000000000000000000000000000000000000000000000000" -> 0x12, hex"3400000000000000000000000000000000000000000000000000000000000000" # double check that the valid case goes through #
// gas Legacy: 22523
// gas LegacyOptimized: 21936
// gas Yul: 22656
// gas YulOptimized: 21795
// f((uint8,bytes1)): 0x1234, hex"5678000000000000000000000000000000000000000000000000000000000000" -> FAILURE
// gas Legacy: 21900
// gas LegacyOptimized: 21666
// gas Yul: 21924
// gas YulOptimized: 21549
// f((uint8,bytes1)): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> FAILURE
// gas Legacy: 22620
// gas LegacyOptimized: 22386
// gas Yul: 22644
// gas YulOptimized: 22269
