contract C {
    function f() public payable returns (uint) {
        return msg.value;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0
// gas Legacy: 21354
// gas LegacyOptimized: 21245
// gas Yul: 21740
// gas YulOptimized: 21206
// f(), 12 ether -> 12000000000000000000
// gas Legacy: 21354
// gas LegacyOptimized: 21245
// gas Yul: 21740
// gas YulOptimized: 21206
