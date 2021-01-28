contract C {
    uint[] storageArray;
    function set_get_length(uint256 len) public returns (uint256) {
        while(storageArray.length < len)
            storageArray.push();
        return storageArray.length;
    }
}
// ====
// compileViaYul: also
// ----
// set_get_length(uint256): 0 -> 0
// gas Legacy: 23415
// gas LegacyOptimized: 23109
// gas Yul: 23912
// gas YulOptimized: 23211
// set_get_length(uint256): 1 -> 1
// gas Legacy: 45164
// gas LegacyOptimized: 44779
// gas Yul: 46926
// gas YulOptimized: 44173
// set_get_length(uint256): 10 -> 10
// gas Legacy: 46260
// gas LegacyOptimized: 45243
// gas Yul: 58142
// gas YulOptimized: 38973
// set_get_length(uint256): 20 -> 20
// gas Legacy: 48797
// gas LegacyOptimized: 47701
// gas Yul: 61944
// gas YulOptimized: 40723
// set_get_length(uint256): 0xFF -> 0xFF
// gas Legacy: 619622
// gas LegacyOptimized: 600751
// gas Yul: 917394
// gas YulOptimized: 434473
// set_get_length(uint256): 0xFFF -> 0xFFF
// gas Legacy: 9765519
// gas LegacyOptimized: 9461853
// gas Yul: 14623616
// gas YulOptimized: 6743235
// set_get_length(uint256): 0xFFFFF -> FAILURE # Out-of-gas #
// gas Legacy: 100000000
// gas LegacyOptimized: 100000000
// gas Yul: 100000000
// gas YulOptimized: 100000000
