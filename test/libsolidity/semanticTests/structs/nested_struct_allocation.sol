contract C {
  struct I {
    uint b;
    uint c;
  }
  struct S {
    I a;
  }

  function f() external returns (uint) {
    S memory s = S(I(1,2));
    return s.a.b;
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 21498
// gas LegacyOptimized: 21354
// gas Yul: 22841
// gas YulOptimized: 21639
