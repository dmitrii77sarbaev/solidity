contract C {
    function f(bytes calldata x) public returns (uint r) {
        assembly { r := x.offset }
    }

    function f(uint, bytes calldata x, uint) public returns (uint r, uint v) {
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
// f(bytes): 0x20, 0, 0 -> 0x44
// gas Legacy: 22130
// gas LegacyOptimized: 21981
// gas Yul: 22439
// gas YulOptimized: 22109
// f(bytes): 0x22, 0, 0, 0 -> 0x46
// gas Legacy: 22258
// gas LegacyOptimized: 22109
// gas Yul: 22567
// gas YulOptimized: 22237
// f(uint256,bytes,uint256): 7, 0x60, 8, 2, 0 -> 0x84, 2
// gas Legacy: 22860
// gas LegacyOptimized: 22321
// gas Yul: 23193
// gas YulOptimized: 22424
// f(uint256,bytes,uint256): 0, 0, 0 -> 0x24, 0x00
// gas Legacy: 22556
// gas LegacyOptimized: 22017
// gas Yul: 22889
// gas YulOptimized: 22120
