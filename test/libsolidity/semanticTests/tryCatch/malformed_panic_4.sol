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
        } catch Error(string memory) {
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
        } catch Error(string memory) {
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
        } catch Error(string memory) {
            assert(false);
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
        } catch Error(string memory) {
            assert(false);
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
// gas Legacy: 23706
// gas LegacyOptimized: 23251
// gas Yul: 24412
// gas YulOptimized: 23620
// b() -> 0x00
// gas Legacy: 23893
// gas LegacyOptimized: 23375
// gas Yul: 24586
// gas YulOptimized: 23750
// c() -> 0x43
// gas Legacy: 23989
// gas LegacyOptimized: 23482
// gas Yul: 24679
// gas YulOptimized: 23843
