contract C {
    function f(uint size) public pure {
        assembly {
            mstore(0, 0x4e487b7100000000000000000000000000000000000000000000000000000000)
            mstore(4, 0x43)
            revert(0, size)
        }
    }
    function a() public returns (uint) {
        try this.f(3) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        }
        // Error will be re-thrown, since there is no low-level catch clause
        assert(false);
    }
    function b() public returns (uint) {
        try this.f(6) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        }
        // Error will be re-thrown, since there is no low-level catch clause
        assert(false);
    }
    function c() public returns (uint) {
        try this.f(0x24) {
            assert(false);
        } catch Panic(uint c) {
            assert(true);
            return c;
        }
        assert(false);
    }
    function d() public returns (uint) {
        try this.f(0x100) {
            assert(false);
        } catch Panic(uint c) {
            assert(true);
            return c;
        }
        assert(false);
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// a() -> FAILURE, hex"4e487b"
// gas Legacy: 23484
// gas LegacyOptimized: 23160
// gas Yul: 23908
// gas YulOptimized: 23283
// b() -> FAILURE, hex"4e487b710000"
// gas Legacy: 23671
// gas LegacyOptimized: 23295
// gas Yul: 24092
// gas YulOptimized: 23423
// c() -> 0x43
// gas Legacy: 23963
// gas LegacyOptimized: 23456
// gas Yul: 24654
// gas YulOptimized: 23818
// d() -> 0x43
// gas Legacy: 23934
// gas LegacyOptimized: 23427
// gas Yul: 24625
// gas YulOptimized: 23789
