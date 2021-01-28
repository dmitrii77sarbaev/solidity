contract C {
    uint256[] storageArray;
    function pushEmpty(uint256 len) public {
        while(storageArray.length < len)
            storageArray.push();

        for (uint i = 0; i < len; i++)
            require(storageArray[i] == 0);
    }
}
// ====
// EVMVersion: >=petersburg
// compileViaYul: also
// ----
// pushEmpty(uint256): 128
// gas Legacy: 607287
// gas LegacyOptimized: 589048
// gas Yul: 855539
// gas YulOptimized: 632037
// pushEmpty(uint256): 256
// gas Legacy: 828983
// gas LegacyOptimized: 802808
// gas Yul: 1162867
// gas YulOptimized: 862821
// pushEmpty(uint256): 32768 -> FAILURE # out-of-gas #
// gas Legacy: 100000000
// gas LegacyOptimized: 100000000
// gas Yul: 100000000
// gas YulOptimized: 100000000
