contract C {
    function f(uint a, uint b) public pure returns (uint x) {
        x = a - b;
    }
    function g(uint8 a, uint8 b) public pure returns (uint8 x) {
        x = a - b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256): 6, 5 -> 1
// gas Legacy: 22285
// gas LegacyOptimized: 21726
// gas Yul: 22592
// gas YulOptimized: 21775
// f(uint256,uint256): 6, 6 -> 0
// gas Legacy: 22285
// gas LegacyOptimized: 21726
// gas Yul: 22592
// gas YulOptimized: 21775
// f(uint256,uint256): 5, 6 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22087
// gas LegacyOptimized: 21654
// gas Yul: 22172
// gas YulOptimized: 21580
// g(uint8,uint8): 6, 5 -> 1
// gas Legacy: 22337
// gas LegacyOptimized: 21924
// gas Yul: 22644
// gas YulOptimized: 22059
// g(uint8,uint8): 6, 6 -> 0
// gas Legacy: 22337
// gas LegacyOptimized: 21924
// gas Yul: 22644
// gas YulOptimized: 22059
// g(uint8,uint8): 5, 6 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22133
// gas LegacyOptimized: 21830
// gas Yul: 22218
// gas YulOptimized: 21847
