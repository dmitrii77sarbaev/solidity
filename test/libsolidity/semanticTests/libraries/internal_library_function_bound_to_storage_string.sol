library L {
    function f(string memory a) internal pure returns (string memory) {
        return a;
    }
    function g(string storage a) internal pure returns (string memory) {
        return a;
    }
}

contract C {
    using L for string;
    string s;

    function test(string calldata x) public returns (string memory, string memory) {
        s = x;
        return (s.f(), s.g());
    }
}
// ====
// compileViaYul: also
// ----
// test(string): 0x20, 3, "def" -> 0x40, 0x80, 3, "def", 3, "def"
// gas Legacy: 50024
// gas LegacyOptimized: 49491
// gas Yul: 47974
// gas YulOptimized: 46295
