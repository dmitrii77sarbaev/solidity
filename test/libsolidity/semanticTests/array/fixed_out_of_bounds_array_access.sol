contract c {
    uint256[4] data;

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
// compileToEwasm: also
// compileViaYul: also
// ----
// length() -> 4
// gas Legacy: 21401
// gas LegacyOptimized: 21292
// gas Yul: 21827
// gas YulOptimized: 21459
// set(uint256,uint256): 3, 4 -> true
// gas Legacy: 42146
// gas LegacyOptimized: 41703
// gas Yul: 43819
// gas YulOptimized: 42798
// set(uint256,uint256): 4, 5 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 21946
// gas LegacyOptimized: 21621
// gas Yul: 22118
// gas YulOptimized: 21664
// set(uint256,uint256): 400, 5 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 21958
// gas LegacyOptimized: 21633
// gas Yul: 22130
// gas YulOptimized: 21676
// get(uint256): 3 -> 4
// gas Legacy: 22657
// gas LegacyOptimized: 22370
// gas Yul: 23339
// gas YulOptimized: 22604
// get(uint256): 4 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 21676
// gas LegacyOptimized: 21499
// gas Yul: 21841
// gas YulOptimized: 21539
// get(uint256): 400 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 21688
// gas LegacyOptimized: 21511
// gas Yul: 21853
// gas YulOptimized: 21551
// length() -> 4
// gas Legacy: 21401
// gas LegacyOptimized: 21292
// gas Yul: 21827
// gas YulOptimized: 21459
