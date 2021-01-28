contract C {
    function f() public returns (string memory, uint256) {
        return ("abc", 8);
    }

    function g() public returns (string memory, string memory) {
        return (h(), "def");
    }

    function h() public returns (string memory) {
        return ("abc");
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x40, 0x8, 0x3, "abc"
// gas Legacy: 21922
// gas LegacyOptimized: 21632
// gas Yul: 22946
// gas YulOptimized: 22064
// g() -> 0x40, 0x80, 0x3, "abc", 0x3, "def"
// gas Legacy: 22421
// gas LegacyOptimized: 22038
// gas Yul: 23880
// gas YulOptimized: 22636
