contract test {
    function f() pure public returns (uint) {
        uint x = 7;
        {
            x = 3; // This should still assign to the outer variable
            uint x;
            x = 4; // This should assign to the new one
        }
        return x;
    }
    function g() pure public returns (uint x) {
        x = 7;
        {
            x = 3;
            uint x;
            return x; // This returns the new variable, i.e. 0
        }
    }
    function h() pure public returns (uint x, uint a, uint b) {
        x = 7;
        {
            x = 3;
            a = x; // This should read from the outer
            uint x = 4;
            b = x;
        }
    }
    function i() pure public returns (uint x, uint a) {
        x = 7;
        {
            x = 3;
            uint x = x; // This should read from the outer and assign to the inner
            a = x;
        }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 3
// gas Legacy: 21413
// gas LegacyOptimized: 21270
// gas Yul: 22059
// gas YulOptimized: 21437
// g() -> 0
// gas Legacy: 21444
// gas LegacyOptimized: 21314
// gas Yul: 22046
// gas YulOptimized: 21481
// h() -> 3, 3, 4
// gas Legacy: 21650
// gas LegacyOptimized: 21349
// gas Yul: 22303
// gas YulOptimized: 21572
// i() -> 3, 3
// gas Legacy: 21580
// gas LegacyOptimized: 21360
// gas Yul: 22135
// gas YulOptimized: 21526
