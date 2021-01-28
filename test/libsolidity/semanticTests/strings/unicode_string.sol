contract C {
    function f() public pure returns (string memory) {
        return unicode"😃, 😭, and 😈";
    }
    function g() public pure returns (string memory) {
        return unicode"😃, 😭,\
 and 😈";
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x20, 0x14, "\xf0\x9f\x98\x83, \xf0\x9f\x98\xad, and \xf0\x9f\x98\x88"
// gas Legacy: 21805
// gas LegacyOptimized: 21560
// gas Yul: 22704
// gas YulOptimized: 21830
// g() -> 0x20, 0x14, "\xf0\x9f\x98\x83, \xf0\x9f\x98\xad, and \xf0\x9f\x98\x88"
// gas Legacy: 21827
// gas LegacyOptimized: 21582
// gas Yul: 22726
// gas YulOptimized: 21852
