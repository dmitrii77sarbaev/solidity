contract C {
	function index(uint256 len) public returns (bool)
	{
		uint[] memory array = new uint[](len);

		for (uint256 i = 0; i < len; i++)
			array[i] = i + 1;

		for (uint256 i = 0; i < len; i++)
			require(array[i] == i + 1, "Unexpected value in array!");

		return array.length == len;
	}
	function accessIndex(uint256 len, int256 idx) public returns (uint256)
	{
		uint[] memory array = new uint[](len);

		for (uint256 i = 0; i < len; i++)
			array[i] = i + 1;

		return array[uint256(idx)];
	}
}
// ====
// compileViaYul: also
// ----
// index(uint256): 0 -> true
// gas Legacy: 21962
// gas LegacyOptimized: 21673
// gas Yul: 23314
// gas YulOptimized: 22042
// index(uint256): 10 -> true
// gas Legacy: 30916
// gas LegacyOptimized: 26854
// gas Yul: 41256
// gas YulOptimized: 27794
// index(uint256): 20 -> true
// gas Legacy: 39807
// gas LegacyOptimized: 31985
// gas Yul: 59187
// gas YulOptimized: 33535
// index(uint256): 0xFF -> true
// gas Legacy: 248854
// gas LegacyOptimized: 152672
// gas Yul: 480674
// gas YulOptimized: 168557
// accessIndex(uint256,int256): 10, 1 -> 2
// gas Legacy: 26803
// gas LegacyOptimized: 24488
// gas Yul: 31835
// gas YulOptimized: 25117
// accessIndex(uint256,int256): 10, 0 -> 1
// gas Legacy: 26791
// gas LegacyOptimized: 24476
// gas Yul: 31823
// gas YulOptimized: 25105
// accessIndex(uint256,int256): 10, 11 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 26604
// gas LegacyOptimized: 24396
// gas Yul: 31299
// gas YulOptimized: 24859
// accessIndex(uint256,int256): 10, 10 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 26604
// gas LegacyOptimized: 24396
// gas Yul: 31299
// gas YulOptimized: 24859
// accessIndex(uint256,int256): 10, -1 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 26976
// gas LegacyOptimized: 24768
// gas Yul: 31671
// gas YulOptimized: 25231
