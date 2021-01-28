contract C {
  function f() public returns (uint y) {
    unchecked{{
        uint max = type(uint).max;
        uint x = max + 1;
        y = x;
    }}
  }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x00
// gas Legacy: 21411
// gas LegacyOptimized: 21270
// gas Yul: 21950
// gas YulOptimized: 21229
