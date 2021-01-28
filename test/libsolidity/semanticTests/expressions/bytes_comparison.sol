contract test {
    function f() public returns (bool) {
        bytes2 a = "a";
        bytes2 x = "aa";
        bytes2 b = "b";
        return a < x && x < b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 21497
// gas LegacyOptimized: 21276
// gas Yul: 22176
// gas YulOptimized: 21229
