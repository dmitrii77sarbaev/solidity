contract C {
    uint[] storageArray;
    function test(uint256 v) public {
        storageArray.push(v);
    }
    function getLength() public view returns (uint256) {
        return storageArray.length;
    }
    function fetch(uint256 a) public view returns (uint256) {
        return storageArray[a];
    }
}
// ====
// compileViaYul: also
// ----
// getLength() -> 0
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// test(uint256): 42 ->
// gas Legacy: 62511
// gas LegacyOptimized: 62236
// gas Yul: 65061
// gas YulOptimized: 64215
// getLength() -> 1
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// fetch(uint256): 0 -> 42
// gas Legacy: 23474
// gas LegacyOptimized: 23190
// gas Yul: 24161
// gas YulOptimized: 23418
// fetch(uint256): 1 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22454
// gas LegacyOptimized: 22277
// gas Yul: 22619
// gas YulOptimized: 22317
// test(uint256): 23 ->
// gas Legacy: 43311
// gas LegacyOptimized: 43036
// gas Yul: 45861
// gas YulOptimized: 45015
// getLength() -> 2
// gas Legacy: 22231
// gas LegacyOptimized: 22114
// gas Yul: 22649
// gas YulOptimized: 22284
// fetch(uint256): 0 -> 42
// gas Legacy: 23474
// gas LegacyOptimized: 23190
// gas Yul: 24161
// gas YulOptimized: 23418
// fetch(uint256): 1 -> 23
// gas Legacy: 23486
// gas LegacyOptimized: 23202
// gas Yul: 24173
// gas YulOptimized: 23430
// fetch(uint256): 2 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22454
// gas LegacyOptimized: 22277
// gas Yul: 22619
// gas YulOptimized: 22317
