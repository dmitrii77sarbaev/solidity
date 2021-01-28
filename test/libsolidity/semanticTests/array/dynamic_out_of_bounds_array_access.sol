contract c {
    uint256[] data;

    function enlarge(uint256 amount) public returns (uint256) {
        while (data.length < amount) data.push();
        return data.length;
    }

    function set(uint256 index, uint256 value) public returns (bool) {
        data[index] = value;
        return true;
    }

    function get(uint256 index) public returns (uint256) {
        return data[index];
    }

    function length() public returns (uint256) {
        return data.length;
    }
}

// ====
// compileViaYul: also
// ----
// length() -> 0
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// get(uint256): 3 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22498
// gas LegacyOptimized: 22321
// gas Yul: 22663
// gas YulOptimized: 22361
// enlarge(uint256): 4 -> 4
// gas Legacy: 52775
// gas LegacyOptimized: 52153
// gas Yul: 58333
// gas YulOptimized: 53146
// length() -> 4
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// set(uint256,uint256): 3, 4 -> true
// gas Legacy: 43019
// gas LegacyOptimized: 42582
// gas Yul: 44697
// gas YulOptimized: 43668
// get(uint256): 3 -> 4
// gas Legacy: 23530
// gas LegacyOptimized: 23246
// gas Yul: 24217
// gas YulOptimized: 23474
// length() -> 4
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// set(uint256,uint256): 4, 8 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22768
// gas LegacyOptimized: 22443
// gas Yul: 22940
// gas YulOptimized: 22486
// length() -> 4
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
