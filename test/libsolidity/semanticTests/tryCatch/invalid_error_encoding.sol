contract C {
    function g(bytes memory revertMsg) public pure returns (uint, uint) {
        assembly { revert(add(revertMsg, 0x20), mload(revertMsg)) }
    }
    function f1() public returns (uint x) {
        // Invalid signature
        try this.g(abi.encodeWithSelector(0x12345678, uint(0), uint(0), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        } catch (bytes memory) {
            return 2;
        }
    }
    function f1a() public returns (uint x) {
        // Invalid signature
        try this.g(abi.encodeWithSelector(0x12345678, uint(0), uint(0), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        } catch {
            return 2;
        }
    }
    function f1b() public returns (uint x) {
        // Invalid signature
        try this.g(abi.encodeWithSelector(0x12345678, uint(0), uint(0), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        }
    }
    function f1c() public returns (uint x) {
        // Invalid signature
        try this.g(abi.encodeWithSelector(0x12345678, uint(0), uint(0), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch {
            return 2;
        }
    }
    function f2() public returns (uint x) {
        // Valid signature but illegal offset
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x100), uint(0), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        } catch (bytes memory) {
            return 2;
        }
    }
    function f2a() public returns (uint x) {
        // Valid signature but illegal offset
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x100), uint(0), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        } catch {
            return 2;
        }
    }
    function f2b() public returns (uint x) {
        // Valid signature but illegal offset
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x100), uint(0), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        }
    }
    function f2c() public returns (uint x) {
        // Valid signature but illegal offset
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x100), uint(0), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch {
            return 1;
        }
    }
    function f3() public returns (uint x) {
        // Valid up to length
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x20), uint(0x30), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        } catch (bytes memory) {
            return 2;
        }
    }
    function f3a() public returns (uint x) {
        // Valid up to length
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x20), uint(0x30), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        } catch (bytes memory) {
            return 2;
        }
    }
    function f3b() public returns (uint x) {
        // Valid up to length
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x20), uint(0x30), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        }
    }
    function f3c() public returns (uint x) {
        // Valid up to length
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x20), uint(0x30), uint(0))) returns (uint a, uint b) {
            return 0;
        } catch {
            return 1;
        }
    }
    function f4() public returns (uint x) {
        // Fully valid
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x20), uint(0x7), bytes7("abcdefg"))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        } catch (bytes memory) {
            return 2;
        }
    }
    function f4a() public returns (uint x) {
        // Fully valid
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x20), uint(0x7), bytes7("abcdefg"))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        } catch {
            return 2;
        }
    }
    function f4b() public returns (uint x) {
        // Fully valid
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x20), uint(0x7), bytes7("abcdefg"))) returns (uint a, uint b) {
            return 0;
        } catch Error(string memory) {
            return 1;
        }
    }
    function f4c() public returns (uint x) {
        // Fully valid
        try this.g(abi.encodeWithSignature("Error(string)", uint(0x20), uint(0x7), bytes7("abcdefg"))) returns (uint a, uint b) {
            return 0;
        } catch {
            return 1;
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// f1() -> 2
// gas Legacy: 25542
// gas LegacyOptimized: 24570
// gas Yul: 27519
// gas YulOptimized: 25561
// f1a() -> 2
// gas Legacy: 25423
// gas LegacyOptimized: 24451
// gas Yul: 26893
// gas YulOptimized: 25140
// f1b() -> FAILURE, hex"12345678", hex"0000000000000000000000000000000000000000000000000000000000000000", hex"0000000000000000000000000000000000000000000000000000000000000000", hex"0000000000000000000000000000000000000000000000000000000000000000"
// gas Legacy: 25269
// gas LegacyOptimized: 24401
// gas Yul: 26220
// gas YulOptimized: 24740
// f1c() -> 2
// gas Legacy: 25265
// gas LegacyOptimized: 24345
// gas Yul: 26557
// gas YulOptimized: 24816
// f2() -> 2
// gas Legacy: 25757
// gas LegacyOptimized: 24759
// gas Yul: 27498
// gas YulOptimized: 25571
// f2a() -> 2
// gas Legacy: 25681
// gas LegacyOptimized: 24683
// gas Yul: 27004
// gas YulOptimized: 25282
// f2b() -> FAILURE, hex"08c379a0", 0x0100, 0, ""
// gas Legacy: 25503
// gas LegacyOptimized: 24609
// gas Yul: 26663
// gas YulOptimized: 25212
// f2c() -> 1
// gas Legacy: 25331
// gas LegacyOptimized: 24402
// gas Yul: 26574
// gas YulOptimized: 24882
// f3() -> 2
// gas Legacy: 25922
// gas LegacyOptimized: 24922
// gas Yul: 27746
// gas YulOptimized: 25729
// f3a() -> 2
// gas Legacy: 25878
// gas LegacyOptimized: 24878
// gas Yul: 27702
// gas YulOptimized: 25685
// f3b() -> FAILURE, hex"08c379a0", 0x20, 0x30, ""
// gas Legacy: 25604
// gas LegacyOptimized: 24708
// gas Yul: 26581
// gas YulOptimized: 25045
// f3c() -> 1
// gas Legacy: 25308
// gas LegacyOptimized: 24379
// gas Yul: 26816
// gas YulOptimized: 25036
// f4() -> 1
// gas Legacy: 25912
// gas LegacyOptimized: 24885
// gas Yul: 27455
// gas YulOptimized: 25651
// f4a() -> 1
// gas Legacy: 25978
// gas LegacyOptimized: 24951
// gas Yul: 27521
// gas YulOptimized: 25717
// f4b() -> 1
// gas Legacy: 25913
// gas LegacyOptimized: 24886
// gas Yul: 27367
// gas YulOptimized: 25563
// f4c() -> 1
// gas Legacy: 25335
// gas LegacyOptimized: 24427
// gas Yul: 26892
// gas YulOptimized: 25164
