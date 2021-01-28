contract C {
    function f(uint size) public pure {
        assembly {
            mstore(0, 0x08c379a000000000000000000000000000000000000000000000000000000000)
            mstore(4, 0x20)
            mstore(0x24, 7)
            mstore(0x44, "abcdefg")
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
    function b2() public returns (uint) {
        try this.f(0x43) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        } catch Error(string memory) {
            assert(false);
        } catch {
            assert(true);
        }
    }
    function b3() public returns (string memory) {
        try this.f(0x4a) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        } catch Error(string memory) {
            assert(false);
        } catch {
            assert(true);
        }
    }
    function c() public returns (string memory) {
        try this.f(0x4b) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        } catch Error(string memory er) {
            assert(true);
            return er;
        } catch {
            assert(false);
        }
    }
    function d() public returns (string memory) {
        try this.f(0x100) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        } catch Error(string memory er) {
            assert(true);
            return er;
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
// gas Legacy: 23750
// gas LegacyOptimized: 23301
// gas Yul: 24477
// gas YulOptimized: 23685
// b() -> 0x00
// gas Legacy: 23921
// gas LegacyOptimized: 23420
// gas Yul: 24637
// gas YulOptimized: 23801
// b2() -> 0x00
// gas Legacy: 23877
// gas LegacyOptimized: 23376
// gas Yul: 24593
// gas YulOptimized: 23757
// b3() -> 0x20, 0x00
// gas Legacy: 24438
// gas LegacyOptimized: 23765
// gas Yul: 25220
// gas YulOptimized: 24199
// c() -> 0x20, 7, "abcdefg"
// gas Legacy: 24674
// gas LegacyOptimized: 23968
// gas Yul: 25450
// gas YulOptimized: 24403
// d() -> 0x20, 7, "abcdefg"
// gas Legacy: 24660
// gas LegacyOptimized: 23954
// gas Yul: 25436
// gas YulOptimized: 24389
