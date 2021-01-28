contract C {
    function f() public returns (bytes32) {
        return sha256("");
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0xe3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
// gas Legacy: 22623
// gas LegacyOptimized: 22202
// gas Yul: 22759
// gas YulOptimized: 22065
