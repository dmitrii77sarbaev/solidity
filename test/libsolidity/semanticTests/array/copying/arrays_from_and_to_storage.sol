contract Test {
    uint24[] public data;
    function set(uint24[] memory _data) public returns (uint) {
        data = _data;
        return data.length;
    }
    function get() public returns (uint24[] memory) {
        return data;
    }
}
// ====
// compileViaYul: also
// ----
// set(uint24[]): 0x20, 18, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 -> 18
// gas Legacy: 125815
// gas LegacyOptimized: 123638
// gas Yul: 130127
// gas YulOptimized: 121147
// data(uint256): 7 -> 8
// gas Legacy: 23625
// gas LegacyOptimized: 23347
// gas Yul: 25068
// gas YulOptimized: 23450
// data(uint256): 15 -> 16
// gas Legacy: 23625
// gas LegacyOptimized: 23347
// gas Yul: 25068
// gas YulOptimized: 23450
// data(uint256): 18 -> FAILURE
// gas Legacy: 22455
// gas LegacyOptimized: 22272
// gas Yul: 22537
// gas YulOptimized: 22288
// get() -> 0x20, 18, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
// gas Legacy: 46068
// gas LegacyOptimized: 42535
// gas Yul: 35030
// gas YulOptimized: 27987
