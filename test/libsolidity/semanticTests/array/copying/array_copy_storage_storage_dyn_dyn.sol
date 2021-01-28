
contract c {
    uint[] data1;
    uint[] data2;
    function setData1(uint length, uint index, uint value) public {
        data1 = new uint[](length);
        if (index < length)
            data1[index] = value;
    }
    function copyStorageStorage() public { data2 = data1; }
    function getData2(uint index) public returns (uint len, uint val) {
        len = data2.length; if (index < len) val = data2[index];
    }
}
// ====
// compileViaYul: also
// ----
// setData1(uint256,uint256,uint256): 10, 5, 4 ->
// gas Legacy: 73107
// gas LegacyOptimized: 72609
// gas Yul: 88567
// gas YulOptimized: 74034
// copyStorageStorage() ->
// gas Legacy: 78978
// gas LegacyOptimized: 78968
// gas Yul: 81357
// gas YulOptimized: 80248
// getData2(uint256): 5 -> 10, 4
// gas Legacy: 24453
// gas LegacyOptimized: 24071
// gas Yul: 25274
// gas YulOptimized: 24320
// setData1(uint256,uint256,uint256): 0, 0, 0 ->
// gas Legacy: 32691
// gas LegacyOptimized: 32129
// gas Yul: 46862
// gas YulOptimized: 32714
// copyStorageStorage() ->
// gas Legacy: 32394
// gas LegacyOptimized: 32305
// gas Yul: 47000
// gas YulOptimized: 33628
// getData2(uint256): 0 -> 0, 0
// gas Legacy: 22753
// gas LegacyOptimized: 22371
// gas Yul: 23187
// gas YulOptimized: 22533
// storage: empty