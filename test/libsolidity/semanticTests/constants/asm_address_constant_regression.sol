// Test for regression of https://github.com/ethereum/solidity/issues/8406

contract C {
  address constant e = 0x1212121212121212121212121000002134593163;

  function f() public returns (bytes1 z) {
    assembly { z := e }
  }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x00
// gas Legacy: 21385
// gas LegacyOptimized: 21297
// gas Yul: 21772
// gas YulOptimized: 21229
