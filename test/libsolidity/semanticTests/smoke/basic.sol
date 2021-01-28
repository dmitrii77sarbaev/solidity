pragma abicoder               v2;

contract C {
    function d() public {
    }
    function e() public payable returns (uint) {
        return msg.value;
    }
    function f(uint a) public pure returns (uint, uint) {
        return (a, a);
    }
    function g() public  pure returns (uint, uint) {
        return (2, 3);
    }
    function h(uint x, uint y) public  pure returns (uint) {
        unchecked { return x - y; }
    }
    function i(bool b) public  pure returns (bool) {
        return !b;
    }
    function j(bytes32 b) public pure returns (bytes32, bytes32) {
        return (b, b);
    }
    function k() public pure returns (uint) {
        return msg.data.length;
    }
    function l(uint a) public pure returns (uint d) {
        return a * 7;
    }
}
// ====
// compileViaYul: also
// ----
// d() ->
// gas Legacy: 21253
// gas LegacyOptimized: 21253
// gas Yul: 21617
// gas YulOptimized: 21405
// e(), 1 wei -> 1
// gas Legacy: 21464
// gas LegacyOptimized: 21355
// gas Yul: 21917
// gas YulOptimized: 21596
// e(), 1 ether -> 1000000000000000000
// gas Legacy: 21464
// gas LegacyOptimized: 21355
// gas Yul: 21917
// gas YulOptimized: 21596
// f(uint256): 3 -> 3, 3
// gas Legacy: 21939
// gas LegacyOptimized: 21552
// gas Yul: 22315
// gas YulOptimized: 21733
// g() -> 2, 3
// gas Legacy: 21581
// gas LegacyOptimized: 21382
// gas Yul: 22215
// gas YulOptimized: 21670
// h(uint256,uint256): 1, -2 -> 3
// gas Legacy: 22497
// gas LegacyOptimized: 22047
// gas Yul: 22966
// gas YulOptimized: 22229
// i(bool): true -> false
// gas Legacy: 21822
// gas LegacyOptimized: 21550
// gas Yul: 22149
// gas YulOptimized: 21649
// j(bytes32): 0x10001 -> 0x10001, 0x10001
// gas Legacy: 21996
// gas LegacyOptimized: 21609
// gas Yul: 22283
// gas YulOptimized: 21701
// k(): hex"4200efef" -> 8
// gas Legacy: 21504
// gas LegacyOptimized: 21387
// gas Yul: 21993
// gas YulOptimized: 21623
// l(uint256): 99 -> 693
// gas Legacy: 22039
// gas LegacyOptimized: 21631
// gas Yul: 22404
// gas YulOptimized: 21723
