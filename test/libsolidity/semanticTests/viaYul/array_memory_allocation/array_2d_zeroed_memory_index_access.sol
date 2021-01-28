contract C {
	uint test1;
	uint test2;
	uint test3;
	uint test4;
	uint test5;
	uint test6;
	uint test7;
	mapping (string => uint) map;
	function set(string memory s, uint n, uint m, uint a, uint b) public returns (uint) {
		map[s] = 0;
		uint[][] memory x = new uint[][](n);
		for (uint i = 0; i < n; ++i)
			x[i] = new uint[](m);
		return x[a][b];
	}
}
// ====
// compileViaYul: also
// ----
// set(string,uint256,uint256,uint256,uint256): 0xa0, 2, 4, 0, 0, 32, "01234567890123456789012345678901" -> 0
// gas Legacy: 26669
// gas LegacyOptimized: 25210
// gas Yul: 31295
// gas YulOptimized: 26490
// set(string,uint256,uint256,uint256,uint256): 0xa0, 2, 4, 1, 3, 32, "01234567890123456789012345678901" -> 0
// gas Legacy: 26693
// gas LegacyOptimized: 25234
// gas Yul: 31319
// gas YulOptimized: 26514
// set(string,uint256,uint256,uint256,uint256): 0xa0, 2, 4, 3, 3, 32, "01234567890123456789012345678901" -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 26439
// gas LegacyOptimized: 25087
// gas Yul: 30622
// gas YulOptimized: 26152
// set(string,uint256,uint256,uint256,uint256): 0xa0, 2, 4, 1, 5, 32, "01234567890123456789012345678901" -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 26488
// gas LegacyOptimized: 25136
// gas Yul: 30777
// gas YulOptimized: 26250
