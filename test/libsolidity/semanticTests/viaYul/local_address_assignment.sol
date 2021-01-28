contract C {
    function f(address a) public pure returns (address x) {
        address b = a;
        x = b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(address): 0x1234 -> 0x1234
// gas Legacy: 21907
// gas LegacyOptimized: 21566
// gas Yul: 22219
// gas YulOptimized: 21441
