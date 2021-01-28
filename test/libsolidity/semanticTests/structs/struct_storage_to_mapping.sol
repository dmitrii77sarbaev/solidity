contract C {
    struct S {
        uint a;
    }
    S s;
    mapping (uint => S) m;

    function f() external returns (bool) {
        s.a = 12;
        m[1] = s;
        return m[1].a == 12;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 63204
// gas LegacyOptimized: 61324
// gas Yul: 66762
// gas YulOptimized: 62388
