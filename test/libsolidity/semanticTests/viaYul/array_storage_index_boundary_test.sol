contract C {
    uint[] storageArray;
    function test_boundary_check(uint256 len, uint256 access) public returns (uint256)
    {
        while(storageArray.length < len)
            storageArray.push();
        while(storageArray.length > len)
            storageArray.pop();
        return storageArray[access];
    }
}
// ====
// compileViaYul: also
// ----
// test_boundary_check(uint256,uint256): 10, 11 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 68983
// gas LegacyOptimized: 67851
// gas Yul: 82131
// gas YulOptimized: 69908
// test_boundary_check(uint256,uint256): 10, 9 -> 0
// gas Legacy: 70017
// gas LegacyOptimized: 68778
// gas Yul: 83687
// gas YulOptimized: 71050
// test_boundary_check(uint256,uint256): 1, 9 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 54527
// gas LegacyOptimized: 54113
// gas Yul: 77561
// gas YulOptimized: 62844
// test_boundary_check(uint256,uint256): 1, 1 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 54527
// gas LegacyOptimized: 54113
// gas Yul: 77561
// gas YulOptimized: 62844
// test_boundary_check(uint256,uint256): 10, 10 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 24413
// gas LegacyOptimized: 24071
// gas Yul: 24911
// gas YulOptimized: 24108
// test_boundary_check(uint256,uint256): 256, 256 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 648515
// gas LegacyOptimized: 628739
// gas Yul: 960203
// gas YulOptimized: 678468
// test_boundary_check(uint256,uint256): 256, 255 -> 0
// gas Legacy: 649549
// gas LegacyOptimized: 629666
// gas Yul: 961759
// gas YulOptimized: 679610
// test_boundary_check(uint256,uint256): 256, 0xFFFF -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 24425
// gas LegacyOptimized: 24083
// gas Yul: 24923
// gas YulOptimized: 24120
// test_boundary_check(uint256,uint256): 256, 2 -> 0
// gas Legacy: 25447
// gas LegacyOptimized: 24998
// gas Yul: 26467
// gas YulOptimized: 25250
