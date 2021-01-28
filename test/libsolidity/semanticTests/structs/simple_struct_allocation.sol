contract C {
  struct S {
    uint a;
  }

  function f() external returns (uint) {
    S memory s = S(1);
    return s.a;
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 21436
// gas LegacyOptimized: 21312
// gas Yul: 22318
// gas YulOptimized: 21475
