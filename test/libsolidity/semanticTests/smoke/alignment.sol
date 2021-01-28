contract C {
    uint256 public stateDecimal = 0x20;
}

contract D {
    bool public stateBool = true;
    uint256 public stateDecimal = 42;
    bytes32 public stateBytes = "\x42\x00\xef";

    function internalStateDecimal() public returns (uint256) {
        return (new C()).stateDecimal();
    }

    function update(bool _bool, uint256 _decimal, bytes32 _bytes) public returns (bool, uint256, bytes32) {
        stateBool = _bool;
        stateDecimal = _decimal;
        stateBytes = _bytes;
        return (stateBool, stateDecimal, stateBytes);
    }
}
// ====
// compileViaYul: also
// ----
// stateBool() -> true
// gas Legacy: 22210
// gas LegacyOptimized: 22082
// gas Yul: 22734
// gas YulOptimized: 22290
// stateBool() -> right(true)
// gas Legacy: 22210
// gas LegacyOptimized: 22082
// gas Yul: 22734
// gas YulOptimized: 22290
// stateDecimal() -> 42
// gas Legacy: 22237
// gas LegacyOptimized: 22136
// gas Yul: 22788
// gas YulOptimized: 22344
// stateDecimal() -> right(42)
// gas Legacy: 22237
// gas LegacyOptimized: 22136
// gas Yul: 22788
// gas YulOptimized: 22344
// stateBytes() -> left(0x4200ef)
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22300
// internalStateDecimal() -> 0x20
// gas Legacy: 120637
// gas LegacyOptimized: 112473
// gas Yul: 165009
// gas YulOptimized: 92529
// update(bool,uint256,bytes32): false, -23, left(0x2300ef) -> false, -23, left(0x2300ef)
// gas Legacy: 28791
// gas LegacyOptimized: 25590
// gas Yul: 32238
// gas YulOptimized: 25830
