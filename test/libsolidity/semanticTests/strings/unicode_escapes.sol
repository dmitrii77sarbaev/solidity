contract C {
    function oneByteUTF8() public pure returns (string memory) {
        return "aaa\u0024aaa"; // usdollar
    }

    function twoBytesUTF8() public pure returns (string memory) {
        return "aaa\u00A2aaa"; // cent
    }

    function threeBytesUTF8() public pure returns (string memory) {
        return "aaa\u20ACaaa"; // euro
    }

    function combined() public pure returns (string memory) {
        return "\u0024\u00A2\u20AC";
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// oneByteUTF8() -> 0x20, 7, "aaa$aaa"
// gas Legacy: 21805
// gas LegacyOptimized: 21560
// gas Yul: 22698
// gas YulOptimized: 21942
// twoBytesUTF8() -> 0x20, 8, "aaa\xc2\xa2aaa"
// gas Legacy: 21827
// gas LegacyOptimized: 21582
// gas Yul: 22726
// gas YulOptimized: 21970
// threeBytesUTF8() -> 0x20, 9, "aaa\xe2\x82\xacaaa"
// gas Legacy: 21849
// gas LegacyOptimized: 21604
// gas Yul: 22748
// gas YulOptimized: 21992
// combined() -> 0x20, 6, "$\xc2\xa2\xe2\x82\xac"
// gas Legacy: 21871
// gas LegacyOptimized: 21626
// gas Yul: 22770
// gas YulOptimized: 22014
