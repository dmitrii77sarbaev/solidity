contract test {
	uint value1;
	uint value2;
	function f(uint x, uint y) public returns (uint w) {
		uint value3 = y;
		value1 += x;
		value3 *= x;
		value2 *= value3 + value1;
		return value2 += 7;
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256): 0, 6 -> 7
// gas Legacy: 47984
// gas LegacyOptimized: 46948
// gas Yul: 52428
// gas YulOptimized: 45335
// f(uint256,uint256): 1, 3 -> 0x23
// gas Legacy: 47996
// gas LegacyOptimized: 46960
// gas Yul: 52440
// gas YulOptimized: 45347
// f(uint256,uint256): 2, 25 -> 0x0746
// gas Legacy: 28796
// gas LegacyOptimized: 27760
// gas Yul: 33240
// gas YulOptimized: 26147
// f(uint256,uint256): 3, 69 -> 396613
// gas Legacy: 28796
// gas LegacyOptimized: 27760
// gas Yul: 33240
// gas YulOptimized: 26147
// f(uint256,uint256): 4, 84 -> 137228105
// gas Legacy: 28796
// gas LegacyOptimized: 27760
// gas Yul: 33240
// gas YulOptimized: 26147
// f(uint256,uint256): 5, 2 -> 0xcc7c5e28
// gas Legacy: 28796
// gas LegacyOptimized: 27760
// gas Yul: 33240
// gas YulOptimized: 26147
// f(uint256,uint256): 6, 51 -> 1121839760671
// gas Legacy: 28796
// gas LegacyOptimized: 27760
// gas Yul: 33240
// gas YulOptimized: 26147
// f(uint256,uint256): 7, 48 -> 408349672884251
// gas Legacy: 28796
// gas LegacyOptimized: 27760
// gas Yul: 33240
// gas YulOptimized: 26147
