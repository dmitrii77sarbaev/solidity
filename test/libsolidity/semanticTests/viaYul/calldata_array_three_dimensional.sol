pragma abicoder               v2;

contract C {
	function f(uint256[][2][] calldata x, uint256 i, uint256 j, uint256 k) external returns (uint256 a, uint256 b, uint256 c, uint256 d) {
		a = x.length;
		b = x[i].length;
		c = x[i][j].length;
		d = x[i][j][k];
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256[][2][],uint256,uint256,uint256): 0x80, 0, 0, 0, 1, 0x20, 0x40, 0x80, 1, 42, 1, 23 -> 1, 2, 1, 42
// gas Legacy: 25236
// gas LegacyOptimized: 24311
// gas Yul: 26258
// gas YulOptimized: 24451
// f(uint256[][2][],uint256,uint256,uint256): 0x80, 0, 1, 0, 1, 0x20, 0x40, 0x80, 1, 42, 1, 23 -> 1, 2, 1, 23
// gas Legacy: 25248
// gas LegacyOptimized: 24323
// gas Yul: 26270
// gas YulOptimized: 24463
// f(uint256[][2][],uint256,uint256,uint256): 0x80, 0, 1, 0, 1, 0x20, 0x40, 0x80, 1, 42, 2, 23, 17 -> 1, 2, 2, 23
// gas Legacy: 25388
// gas LegacyOptimized: 24463
// gas Yul: 26410
// gas YulOptimized: 24603
// f(uint256[][2][],uint256,uint256,uint256): 0x80, 0, 1, 1, 1, 0x20, 0x40, 0x80, 1, 42, 2, 23, 17 -> 1, 2, 2, 17
// gas Legacy: 25400
// gas LegacyOptimized: 24475
// gas Yul: 26422
// gas YulOptimized: 24615
// f(uint256[][2][],uint256,uint256,uint256): 0x80, 1, 0, 0, 1, 0x20, 0x40, 0x80, 1, 42, 1, 23 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23755
// gas LegacyOptimized: 23221
// gas Yul: 23970
// gas YulOptimized: 23172
// f(uint256[][2][],uint256,uint256,uint256): 0x80, 0, 2, 0, 1, 0x20, 0x40, 0x80, 1, 42, 1, 23 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 24077
// gas LegacyOptimized: 23529
// gas Yul: 24447
// gas YulOptimized: 23493
// f(uint256[][2][],uint256,uint256,uint256): 0x80, 0, 2, 0, 1, 0x20, 0x40, 0x80, 1, 42, 1, 23 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 24077
// gas LegacyOptimized: 23529
// gas Yul: 24447
// gas YulOptimized: 23493
