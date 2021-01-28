contract C {
    uint[] storageArray;
    function set_get_length(uint256 len) public returns (uint256) {
        while(storageArray.length < len)
            storageArray.push();
        while(storageArray.length > 0)
            storageArray.pop();
        return storageArray.length;
    }
}
// ====
// compileViaYul: also
// ----
// set_get_length(uint256): 0 -> 0
// gas Legacy: 24250
// gas LegacyOptimized: 23929
// gas Yul: 24953
// gas YulOptimized: 24067
// set_get_length(uint256): 1 -> 0
// gas Legacy: 49345
// gas LegacyOptimized: 48931
// gas Yul: 53861
// gas YulOptimized: 50214
// set_get_length(uint256): 10 -> 0
// gas Legacy: 83092
// gas LegacyOptimized: 81841
// gas Yul: 121925
// gas YulOptimized: 93429
// set_get_length(uint256): 20 -> 0
// gas Legacy: 141922
// gas LegacyOptimized: 139741
// gas Yul: 218885
// gas YulOptimized: 162779
// set_get_length(uint256): 0xFF -> 0
// gas Legacy: 1524427
// gas LegacyOptimized: 1500391
// gas Yul: 2497445
// gas YulOptimized: 1792504
// set_get_length(uint256): 0xFFF -> 0
// gas Legacy: 24115159
// gas LegacyOptimized: 23734003
// gas Yul: 39730097
// gas YulOptimized: 28422916
// set_get_length(uint256): 0xFFFF -> FAILURE # Out-of-gas #
// gas Legacy: 100000000
// gas LegacyOptimized: 100000000
// gas Yul: 100000000
// gas YulOptimized: 100000000
