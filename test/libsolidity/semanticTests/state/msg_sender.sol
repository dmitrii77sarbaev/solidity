contract C {
    function f() public returns (address) {
        return msg.sender;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x1212121212121212121212121212120000000012
// gas Legacy: 21427
// gas LegacyOptimized: 21293
// gas Yul: 21821
// gas YulOptimized: 21228
