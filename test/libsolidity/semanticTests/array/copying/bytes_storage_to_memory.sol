contract C {
  bytes s = "abcd";
  function f() external returns (bytes1) {
    bytes memory data = s;
    return data[0];
  }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> "a"
// gas Legacy: 24304
// gas LegacyOptimized: 24217
// gas Yul: 23599
// gas YulOptimized: 22791
