contract C {
    function shl_1() public returns (bool) {
        uint256 c;
        assembly {
            c := shl(2, 1)
        }
        assert(c == 4);
        return true;
    }

    function shl_2() public returns (bool) {
        uint256 c;
        assembly {
            c := shl(
                1,
                0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            )
        }
        assert(
            c ==
                0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe
        );
        return true;
    }

    function shl_3() public returns (bool) {
        uint256 c;
        assembly {
            c := shl(
                256,
                0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            )
        }
        assert(c == 0);
        return true;
    }

    function shr_1() public returns (bool) {
        uint256 c;
        assembly {
            c := shr(1, 3)
        }
        assert(c == 1);
        return true;
    }

    function shr_2() public returns (bool) {
        uint256 c;
        assembly {
            c := shr(
                1,
                0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            )
        }
        assert(
            c ==
                0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
        );
        return true;
    }

    function shr_3() public returns (bool) {
        uint256 c;
        assembly {
            c := shr(
                256,
                0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            )
        }
        assert(c == 0);
        return true;
    }
}
// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// shl_1() -> 0x01
// gas Legacy: 21471
// gas LegacyOptimized: 21345
// gas Yul: 22065
// gas YulOptimized: 21490
// shl_2() -> 0x01
// gas Legacy: 21427
// gas LegacyOptimized: 21293
// gas Yul: 22027
// gas YulOptimized: 21446
// shl_3() -> 0x01
// gas Legacy: 21515
// gas LegacyOptimized: 21389
// gas Yul: 22112
// gas YulOptimized: 21534
// shr_1() -> 0x01
// gas Legacy: 21537
// gas LegacyOptimized: 21411
// gas Yul: 22131
// gas YulOptimized: 21556
// shr_2() -> 0x01
// gas Legacy: 21449
// gas LegacyOptimized: 21335
// gas Yul: 22058
// gas YulOptimized: 21468
// shr_3() -> 0x01
// gas Legacy: 21493
// gas LegacyOptimized: 21367
// gas Yul: 22090
// gas YulOptimized: 21512
