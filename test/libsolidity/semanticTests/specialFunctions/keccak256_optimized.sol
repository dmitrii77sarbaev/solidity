// tests compile-time evaluation of keccak256 on literal strings
contract C {
    function short() public pure returns (bool) {
        bytes32 a = keccak256("abcdefghijklmn");
        bytes memory s = "abcdefghijklmn";
        return a == keccak256(s);
    }
    bytes32 constant sc = keccak256("abcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmn");
    function long() public pure returns (bool, bool) {
        bytes32 a = keccak256("abcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmn");
        bytes memory s = "abcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmnabcdefghijklmn";
        return (a == keccak256(s), sc == keccak256(s));
    }
}
// ====
// compileViaYul: also
// ----
// short() -> true
// gas Legacy: 21543
// gas LegacyOptimized: 21364
// gas Yul: 22592
// gas YulOptimized: 21803
// long() -> true, true
// gas Legacy: 21810
// gas LegacyOptimized: 21533
// gas Yul: 23169
// gas YulOptimized: 21987
