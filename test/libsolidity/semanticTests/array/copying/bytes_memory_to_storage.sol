contract C {
  bytes s;
  function f() external returns (bytes1) {
    bytes memory data = "abcd";
    s = data;
    return s[0];
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> "a"
// gas Legacy: 45279
// gas LegacyOptimized: 45173
// gas Yul: 45989
// gas YulOptimized: 44638
