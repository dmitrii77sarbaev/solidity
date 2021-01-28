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
        }
        // Error will be re-thrown, since there is no low-level catch clause
        assert(false);
    }
    function b() public returns (uint) {
        try this.f(6) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        } catch Error(string memory) {
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
        } catch Error(string memory) {
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
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// a() -> FAILURE, hex"4e487b"
// gas Legacy: 23510
// gas LegacyOptimized: 23186
// gas Yul: 23943
// gas YulOptimized: 23318
// b() -> FAILURE, hex"4e487b710000"
// gas Legacy: 23697
// gas LegacyOptimized: 23310
// gas Yul: 24117
// gas YulOptimized: 23448
// c() -> 0x43
// gas Legacy: 23989
// gas LegacyOptimized: 23482
// gas Yul: 24679
// gas YulOptimized: 23843
// d() -> 0x43
// gas Legacy: 23960
// gas LegacyOptimized: 23453
// gas Yul: 24650
// gas YulOptimized: 23814
