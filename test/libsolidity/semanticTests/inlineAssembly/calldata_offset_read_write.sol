contract C {
    function f(uint, bytes calldata x, uint) public returns (uint r, uint v) {
        assembly {
            x.offset := 8
            x.length := 20
        }
        assembly {
            r := x.offset
            v := x.length
        }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,bytes,uint256): 7, 0x60, 8, 2, 0 -> 8, 0x14
// gas Legacy: 22876
// gas LegacyOptimized: 22286
// gas Yul: 23208
// gas YulOptimized: 22318
// f(uint256,bytes,uint256): 0, 0, 0 -> 8, 0x14
// gas Legacy: 22572
// gas LegacyOptimized: 21982
// gas Yul: 22904
// gas YulOptimized: 22014
