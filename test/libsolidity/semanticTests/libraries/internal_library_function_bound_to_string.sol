library L {
    function at(string memory a, uint i) internal pure returns (uint8) {
        return uint8(bytes(a)[i]);
    }
}

contract C {
    using L for string;

    function secondChar() public returns (uint8) {
        string memory input = "abc";
        return input.at(1);
    }
}
// ====
// compileViaYul: also
// ----
// secondChar() -> 98
// gas Legacy: 21573
// gas LegacyOptimized: 21453
// gas Yul: 23005
// gas YulOptimized: 21519
