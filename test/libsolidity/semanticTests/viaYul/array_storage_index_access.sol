contract C {
    uint[] storageArray;
    function test_indices(uint256 len) public
    {
        while (storageArray.length < len)
            storageArray.push();
        while (storageArray.length > len)
            storageArray.pop();
        for (uint i = 0; i < len; i++)
            storageArray[i] = i + 1;

        for (uint i = 0; i < len; i++)
            require(storageArray[i] == i + 1);
    }
}
// ====
// compileViaYul: also
// ----
// test_indices(uint256): 1 ->
// gas Legacy: 68402
// gas LegacyOptimized: 67743
// gas Yul: 73021
// gas YulOptimized: 70146
// test_indices(uint256): 129 ->
// gas Legacy: 3340105
// gas LegacyOptimized: 3280773
// gas Yul: 3797603
// gas YulOptimized: 3572413
// test_indices(uint256): 5 ->
// gas Legacy: 458941
// gas LegacyOptimized: 455849
// gas Yul: 781923
// gas YulOptimized: 684693
// test_indices(uint256): 10 ->
// gas Legacy: 77437
// gas LegacyOptimized: 73042
// gas Yul: 107663
// gas YulOptimized: 90522
// test_indices(uint256): 15 ->
// gas Legacy: 98152
// gas LegacyOptimized: 91857
// gas Yul: 139793
// gas YulOptimized: 115342
// test_indices(uint256): 0xFF ->
// gas Legacy: 4107867
// gas LegacyOptimized: 3991807
// gas Yul: 4994703
// gas YulOptimized: 4554277
// test_indices(uint256): 1000 ->
// gas Legacy: 20360399
// gas LegacyOptimized: 19921344
// gas Yul: 23586895
// gas YulOptimized: 21917394
// test_indices(uint256): 129 ->
// gas Legacy: 3472135
// gas LegacyOptimized: 3415947
// gas Yul: 5948697
// gas YulOptimized: 5135327
// test_indices(uint256): 128 ->
// gas Legacy: 556972
// gas LegacyOptimized: 508124
// gas Yul: 852771
// gas YulOptimized: 663783
// test_indices(uint256): 1 ->
// gas Legacy: 452407
// gas LegacyOptimized: 450811
// gas Yul: 773769
// gas YulOptimized: 680239
