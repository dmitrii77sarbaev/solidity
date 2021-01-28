contract C {
    function f() public returns (bytes4) {
        return msg.sig;
    }
    function g() public returns (bytes4) {
        return msg.sig;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x26121ff000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21394
// gas LegacyOptimized: 21321
// gas Yul: 21788
// gas YulOptimized: 21432
// g() -> 0xe2179b8e00000000000000000000000000000000000000000000000000000000
// gas Legacy: 21416
// gas LegacyOptimized: 21343
// gas Yul: 21810
// gas YulOptimized: 21486
