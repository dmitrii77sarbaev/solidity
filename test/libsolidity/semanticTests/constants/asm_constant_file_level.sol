address constant e = 0x1212121212121212121212121000002134593163;

contract C {
  function f() public returns (address z) {
    assembly { z := e }
  }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x1212121212121212121212121000002134593163
// gas Legacy: 21428
// gas LegacyOptimized: 21294
// gas Yul: 21822
// gas YulOptimized: 21229
