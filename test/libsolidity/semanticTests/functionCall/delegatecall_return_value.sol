contract C {
    uint256 value;

    function set(uint256 _value) external {
        value = _value;
    }

    function get() external view returns (uint256) {
        return value;
    }

    function get_delegated() external returns (bool, bytes memory) {
        return address(this).delegatecall(abi.encodeWithSignature("get()"));
    }

    function assert0() external view {
        assert(value == 0);
    }

    function assert0_delegated() external returns (bool, bytes memory) {
        return address(this).delegatecall(abi.encodeWithSignature("assert0()"));
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// get() -> 0x00
// gas Legacy: 22245
// gas LegacyOptimized: 22136
// gas Yul: 22809
// gas YulOptimized: 22344
// assert0_delegated() -> 0x01, 0x40, 0x0
// gas Legacy: 24159
// gas LegacyOptimized: 23681
// gas Yul: 25362
// gas YulOptimized: 23932
// get_delegated() -> 0x01, 0x40, 0x20, 0x0
// gas Legacy: 24417
// gas LegacyOptimized: 23825
// gas Yul: 25772
// gas YulOptimized: 24200
// set(uint256): 0x01 ->
// gas Legacy: 41624
// gas LegacyOptimized: 41428
// gas Yul: 43057
// gas YulOptimized: 41611
// get() -> 0x01
// gas Legacy: 22245
// gas LegacyOptimized: 22136
// gas Yul: 22809
// gas YulOptimized: 22344
// assert0_delegated() -> 0x00, 0x40, 0x24, 0x4e487b7100000000000000000000000000000000000000000000000000000000, 0x0100000000000000000000000000000000000000000000000000000000
// gas Legacy: 24426
// gas LegacyOptimized: 23938
// gas Yul: 25694
// gas YulOptimized: 24214
// get_delegated() -> 0x01, 0x40, 0x20, 0x1
// gas Legacy: 24417
// gas LegacyOptimized: 23825
// gas Yul: 25772
// gas YulOptimized: 24200
// set(uint256): 0x2a ->
// gas Legacy: 22424
// gas LegacyOptimized: 22228
// gas Yul: 23857
// gas YulOptimized: 22411
// get() -> 0x2a
// gas Legacy: 22245
// gas LegacyOptimized: 22136
// gas Yul: 22809
// gas YulOptimized: 22344
// assert0_delegated() -> 0x00, 0x40, 0x24, 0x4e487b7100000000000000000000000000000000000000000000000000000000, 0x0100000000000000000000000000000000000000000000000000000000
// gas Legacy: 24426
// gas LegacyOptimized: 23938
// gas Yul: 25694
// gas YulOptimized: 24214
// get_delegated() -> 0x01, 0x40, 0x20, 0x2a
// gas Legacy: 24417
// gas LegacyOptimized: 23825
// gas Yul: 25772
// gas YulOptimized: 24200
