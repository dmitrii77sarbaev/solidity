contract C {
    function e(bytes memory b) public pure returns (bytes memory) {
        return b;
    }
    function f() public pure returns (string memory, string memory) {
        return ("any", "any");
    }
    function g() public pure returns (string memory, uint, string memory) {
        return ("any", 42, "any");
    }
    function h() public pure returns (string memory) {
        return "any";
    }
}
// ====
// compileViaYul: also
// ----
// e(bytes): 32, 3, hex"AB33BB" -> 32, 3, left(0xAB33BB)
// gas Legacy: 22899
// gas LegacyOptimized: 22279
// gas Yul: 23204
// gas YulOptimized: 22455
// e(bytes): 32, 32, 0x20 -> 32, 32, 0x20
// gas Legacy: 22973
// gas LegacyOptimized: 22347
// gas Yul: 23278
// gas YulOptimized: 22523
// e(bytes): 32, 3, hex"AB33FF" -> 32, 3, hex"ab33ff0000000000000000000000000000000000000000000000000000000000"
// gas Legacy: 22899
// gas LegacyOptimized: 22279
// gas Yul: 23204
// gas YulOptimized: 22455
// f() -> 0x40, 0x80, 3, "any", 3, "any"
// gas Legacy: 22342
// gas LegacyOptimized: 21946
// gas Yul: 23756
// gas YulOptimized: 22451
// g() -> 0x60, 0x2a, 0xa0, 3, "any", 3, "any"
// gas Legacy: 22525
// gas LegacyOptimized: 22044
// gas Yul: 24070
// gas YulOptimized: 22554
// h() -> 0x20, 3, "any"
// gas Legacy: 21849
// gas LegacyOptimized: 21644
// gas Yul: 22742
// gas YulOptimized: 21949
