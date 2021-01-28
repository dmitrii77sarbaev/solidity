contract C {
    function f(bytes calldata b) public returns (bool correct) {
        bytes1 a = b[3];
        uint r;
        assembly {
            r := a
        }
        correct = r == (0x64 << 248);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bytes): 0x20, 0x04, "dead" -> true
// gas Legacy: 22258
// gas LegacyOptimized: 22080
// gas Yul: 22932
// gas YulOptimized: 22139
