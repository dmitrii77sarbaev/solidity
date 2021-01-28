contract C {
    function f() public returns (uint) {
    }
    function g(uint x, uint y) public returns (uint) {
    }
    function h() public payable returns (uint) {
    }
    function i(bytes32 b) public returns (bytes32) {
    }
    function j(bool b) public returns (bool) {
    }
    function k(bytes32 b) public returns (bytes32) {
    }
    function s() public returns (uint256[] memory) {
    }
    function t(uint) public pure {
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0
// gas Legacy: 21416
// gas LegacyOptimized: 21315
// gas Yul: 21775
// gas YulOptimized: 21462
// g(uint256,uint256): 1, -2 -> 0
// gas Legacy: 22484
// gas LegacyOptimized: 22052
// gas Yul: 22771
// gas YulOptimized: 22139
// h(), 1 ether -> 0
// gas Legacy: 21391
// gas LegacyOptimized: 21290
// gas Yul: 21844
// gas YulOptimized: 21531
// i(bytes32), 1 ether: 2 -> FAILURE
// gas Legacy: 21372
// gas LegacyOptimized: 21372
// gas Yul: 21396
// gas YulOptimized: 21358
// i(bytes32): 2 -> 0
// gas Legacy: 21843
// gas LegacyOptimized: 21556
// gas Yul: 22120
// gas YulOptimized: 21646
// j(bool): true -> false
// gas Legacy: 21854
// gas LegacyOptimized: 21595
// gas Yul: 22220
// gas YulOptimized: 21780
// k(bytes32): 0x31 -> 0x00
// gas Legacy: 21864
// gas LegacyOptimized: 21577
// gas Yul: 22230
// gas YulOptimized: 21756
// s(): hex"4200ef" -> 0x20, 0
// gas Legacy: 21705
// gas LegacyOptimized: 21502
// gas Yul: 22061
// gas YulOptimized: 21637
// t(uint256) -> FAILURE
// gas Legacy: 21268
// gas LegacyOptimized: 21247
// gas Yul: 21355
// gas YulOptimized: 21317
