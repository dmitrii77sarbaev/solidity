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
        } catch {
            assert(true);
        }
    }
    function b() public returns (uint) {
        try this.f(6) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        } catch {
            assert(true);
        }
    }
    function c() public returns (uint) {
        try this.f(0x24) {
            assert(false);
        } catch Panic(uint c) {
            assert(true);
            return c;
        } catch {
            assert(false);
        }
    }
    function d() public returns (uint) {
        try this.f(0x100) {
            assert(false);
        } catch Panic(uint c) {
            assert(true);
            return c;
        } catch {
            assert(false);
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// a() -> 0x00
// gas Legacy: 23680
// gas LegacyOptimized: 23225
// gas Yul: 24377
// gas YulOptimized: 23580
// b() -> 0x00
// gas Legacy: 23867
// gas LegacyOptimized: 23360
// gas Yul: 24561
// gas YulOptimized: 23720
// c() -> 0x43
// gas Legacy: 23963
// gas LegacyOptimized: 23456
// gas Yul: 24654
// gas YulOptimized: 23813
// d() -> 0x43
// gas Legacy: 23934
// gas LegacyOptimized: 23427
// gas Yul: 24625
// gas YulOptimized: 23784
