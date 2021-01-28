contract c {
    fallback() external { data = msg.data; }
    function del() public returns (bool) { delete data; return true; }
    bytes data;
}
// ====
// compileViaYul: also
// ----
// (): 7 ->
// gas Legacy: 62570
// gas LegacyOptimized: 62532
// gas Yul: 62821
// gas YulOptimized: 62629
// storage: nonempty// del(): 7 -> true
// gas Legacy: 24311
// gas LegacyOptimized: 24184
// gas Yul: 26106
// gas YulOptimized: 25359
// storage: empty