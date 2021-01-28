contract Test {
    uint24[3][] public data;

    function set(uint24[3][] memory _data) public returns (uint256) {
        data = _data;
        return data.length;
    }

    function get() public returns (uint24[3][] memory) {
        return data;
    }
}
// ====
// compileViaYul: also
// ----
// set(uint24[3][]): 0x20, 0x06, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12 -> 0x06
// gas Legacy: 278685
// gas LegacyOptimized: 273772
// gas Yul: 213897
// gas YulOptimized: 200205
// data(uint256,uint256): 0x02, 0x02 -> 0x09
// gas Legacy: 23948
// gas LegacyOptimized: 23522
// gas Yul: 25654
// gas YulOptimized: 23641
// data(uint256,uint256): 0x05, 0x01 -> 0x11
// gas Legacy: 23948
// gas LegacyOptimized: 23522
// gas Yul: 25654
// gas YulOptimized: 23641
// data(uint256,uint256): 0x06, 0x00 -> FAILURE
// gas Legacy: 22732
// gas LegacyOptimized: 22401
// gas Yul: 22824
// gas YulOptimized: 22423
// get() -> 0x20, 0x06, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12
// gas Legacy: 48852
// gas LegacyOptimized: 43387
// gas Yul: 45667
// gas YulOptimized: 32044
