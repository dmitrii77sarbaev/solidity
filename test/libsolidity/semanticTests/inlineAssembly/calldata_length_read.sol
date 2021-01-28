contract C {
    function lenBytesRead(bytes calldata x) public returns (uint l) {
        assembly { l := x.length }
    }

    function lenStringRead(string calldata x) public returns (uint l) {
        assembly { l := x.length }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// lenBytesRead(bytes): 0x20, 4, "abcd" -> 4
// gas Legacy: 22190
// gas LegacyOptimized: 22044
// gas Yul: 22499
// gas YulOptimized: 22058
// lenBytesRead(bytes): 0x20, 0, "abcd" -> 0x00
// gas Legacy: 22178
// gas LegacyOptimized: 22032
// gas Yul: 22487
// gas YulOptimized: 22046
// lenBytesRead(bytes): 0x20, 0x21, "abcd", "ef" -> 33
// gas Legacy: 22342
// gas LegacyOptimized: 22196
// gas Yul: 22651
// gas YulOptimized: 22210
// lenStringRead(string): 0x20, 4, "abcd" -> 4
// gas Legacy: 22168
// gas LegacyOptimized: 22022
// gas Yul: 22477
// gas YulOptimized: 22036
// lenStringRead(string): 0x20, 0, "abcd" -> 0x00
// gas Legacy: 22156
// gas LegacyOptimized: 22010
// gas Yul: 22465
// gas YulOptimized: 22024
// lenStringRead(string): 0x20, 0x21, "abcd", "ef" -> 33
// gas Legacy: 22320
// gas LegacyOptimized: 22174
// gas Yul: 22629
// gas YulOptimized: 22188
