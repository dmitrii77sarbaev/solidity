contract C {
	function test(uint256 len, uint idx) public returns (uint256)
	{
		uint[] memory array = new uint[](len);
		uint result = receiver(array, idx);

		for (uint256 i = 0; i < array.length; i++)
			require(array[i] == i + 1);

		return result;
	}
	function receiver(uint[] memory array, uint idx) public returns (uint256)
	{
		for (uint256 i = 0; i < array.length; i++)
			array[i] = i + 1;

		return array[idx];
	}
}
// ====
// compileViaYul: also
// ----
// test(uint256,uint256): 0, 0 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22126
// gas LegacyOptimized: 21793
// gas Yul: 23082
// gas YulOptimized: 22086
// test(uint256,uint256): 1, 0 -> 1
// gas Legacy: 23353
// gas LegacyOptimized: 22516
// gas Yul: 25835
// gas YulOptimized: 23080
// test(uint256,uint256): 10, 5 -> 6
// gas Legacy: 31420
// gas LegacyOptimized: 27199
// gas Yul: 42830
// gas YulOptimized: 28726
// test(uint256,uint256): 10, 50 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 26672
// gas LegacyOptimized: 24456
// gas Yul: 31796
// gas YulOptimized: 25130
