contract test {
    function f() public returns (bool) {
        int256 x = -2**255;
        unchecked { assert(-x == x); }
        return true;
    }
}

// ====
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 21427
// gas LegacyOptimized: 21276
// gas Yul: 22111
// gas YulOptimized: 21229
