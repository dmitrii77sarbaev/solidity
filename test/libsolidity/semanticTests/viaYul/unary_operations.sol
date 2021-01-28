contract C {
	function preincr_u8(uint8 a) public pure returns (uint8) {
		return ++a + a;
	}
	function postincr_u8(uint8 a) public pure returns (uint8) {
		return a++ + a;
	}
	function predecr_u8(uint8 a) public pure returns (uint8) {
		return --a + a;
	}
	function postdecr_u8(uint8 a) public pure returns (uint8) {
		return a-- + a;
	}
	function preincr_s8(int8 a) public pure returns (int8 ret1, int8 ret2) {
		ret1 = ++a;
		ret2 = a;
	}
	function postincr_s8(int8 a) public pure returns (int8 ret1, int8 ret2) {
		ret1 = a++;
		ret2 = a;
	}
	function predecr_s8(int8 a) public pure returns (int8 ret1, int8 ret2) {
		ret1 = --a;
		ret2 = a;
	}
	function postdecr_s8(int8 a) public pure returns (int8 ret1, int8 ret2) {
		ret1 = a--;
		ret2 = a;
	}
	function preincr(uint a) public pure returns (uint) {
		return ++a + a;
	}
	function postincr(uint a) public pure returns (uint) {
		return a++ + a;
	}
	function predecr(uint a) public pure returns (uint) {
		return --a + a;
	}
	function postdecr(uint a) public pure returns (uint) {
		return a-- + a;
	}
	function not(bool a) public pure returns (bool)
	{
		return !a;
	}
	function bitnot(int256 a) public pure returns (int256)
	{
		return ~a;
	}
	function bitnot_u8(uint8 a) public pure returns (uint256 ret)
	{
		a = ~a;
		assembly {
			// Tests that the lower bit parts are cleaned up
			ret := a
		}
	}
	function bitnot_s8() public pure returns (int256 ret)
	{
		int8 a;
		assembly {
			a := 0x9C
		}

		a = ~a;

		assembly {
			// Tests that the lower bit parts are cleaned up
			ret := a
		}
	}
	function negate(int256 a) public pure returns (int256)
	{
		return -a;
	}
	function negate_s8(int8 a) public pure returns (int8)
	{
		return -a;
	}
	function negate_s16(int16 a) public pure returns (int16)
	{
		return -a;
	}
}
// ====
// compileViaYul: true
// ----
// preincr_s8(int8): 128 -> FAILURE
// gas Yul: 21682
// gas YulOptimized: 21547
// postincr_s8(int8): 128 -> FAILURE
// gas Yul: 21814
// gas YulOptimized: 21676
// preincr_s8(int8): 127 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21955
// gas YulOptimized: 21668
// postincr_s8(int8): 127 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 22090
// gas YulOptimized: 21803
// preincr_s8(int8): 126 -> 127, 127
// gas Yul: 22510
// gas YulOptimized: 21902
// postincr_s8(int8): 126 -> 126, 127
// gas Yul: 22642
// gas YulOptimized: 22037
// predecr_s8(int8): -128 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 22286
// gas YulOptimized: 21999
// postdecr_s8(int8): -128 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 22575
// gas YulOptimized: 22288
// predecr_s8(int8): -127 -> -128, -128
// gas Yul: 22841
// gas YulOptimized: 22236
// postdecr_s8(int8): -127 -> -127, -128
// gas Yul: 23127
// gas YulOptimized: 22525
// preincr_s8(int8): -5 -> -4, -4
// gas Yul: 22882
// gas YulOptimized: 22274
// postincr_s8(int8): -5 -> -5, -4
// gas Yul: 23014
// gas YulOptimized: 22409
// predecr_s8(int8): -5 -> -6, -6
// gas Yul: 22841
// gas YulOptimized: 22236
// postdecr_s8(int8): -5 -> -5, -6
// gas Yul: 23127
// gas YulOptimized: 22525
// preincr_u8(uint8): 255 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 22006
// gas YulOptimized: 21751
// postincr_u8(uint8): 255 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21921
// gas YulOptimized: 21666
// preincr_u8(uint8): 254 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 22218
// gas YulOptimized: 21859
// postincr_u8(uint8): 254 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 22130
// gas YulOptimized: 21768
// predecr_u8(uint8): 0 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21972
// gas YulOptimized: 21714
// postdecr_u8(uint8): 0 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21799
// gas YulOptimized: 21541
// predecr_u8(uint8): 1 -> 0
// gas Yul: 22622
// gas YulOptimized: 22067
// postdecr_u8(uint8): 1 -> 1
// gas Yul: 22446
// gas YulOptimized: 21886
// preincr_u8(uint8): 2 -> 6
// gas Yul: 22644
// gas YulOptimized: 22089
// postincr_u8(uint8): 2 -> 5
// gas Yul: 22556
// gas YulOptimized: 21996
// predecr_u8(uint8): 2 -> 2
// gas Yul: 22622
// gas YulOptimized: 22067
// postdecr_u8(uint8): 2 -> 3
// gas Yul: 22446
// gas YulOptimized: 21886
// preincr(uint256): 2 -> 6
// gas Yul: 22444
// gas YulOptimized: 21834
// postincr(uint256): 2 -> 5
// gas Yul: 22752
// gas YulOptimized: 22137
// predecr(uint256): 2 -> 2
// gas Yul: 22815
// gas YulOptimized: 22205
// postdecr(uint256): 2 -> 3
// gas Yul: 22463
// gas YulOptimized: 21848
// not(bool): true -> false
// gas Yul: 22435
// gas YulOptimized: 21935
// not(bool): false -> true
// gas Yul: 22423
// gas YulOptimized: 21923
// bitnot(int256): 5 -> -6
// gas Yul: 22351
// gas YulOptimized: 21823
// bitnot(int256): 10 -> -11
// gas Yul: 22351
// gas YulOptimized: 21823
// bitnot(int256): 0 -> -1
// gas Yul: 22339
// gas YulOptimized: 21811
// bitnot(int256): -100 -> 99
// gas Yul: 22723
// gas YulOptimized: 22195
// bitnot_u8(uint8): 100 -> 155
// gas Yul: 22393
// gas YulOptimized: 21935
// bitnot_s8() -> 99
// gas Yul: 22035
// gas YulOptimized: 21594
// negate(int256): -57896044618658097711785492504343953926634992332820282019728792003956564819968 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21868
// gas YulOptimized: 21555
// negate(int256): -57896044618658097711785492504343953926634992332820282019728792003956564819967 -> 57896044618658097711785492504343953926634992332820282019728792003956564819967
// gas Yul: 22296
// gas YulOptimized: 21760
// negate(int256): 0 -> 0
// gas Yul: 22272
// gas YulOptimized: 21736
// negate(int256): 1 -> -1
// gas Yul: 22284
// gas YulOptimized: 21748
// negate(int256): -1 -> 1
// gas Yul: 22656
// gas YulOptimized: 22120
// negate_s8(int8): -128 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 22495
// gas YulOptimized: 22219
// negate_s8(int8): -138 -> FAILURE
// gas Yul: 22230
// gas YulOptimized: 22095
// negate_s8(int8): -127 -> 127
// gas Yul: 22919
// gas YulOptimized: 22422
// negate_s8(int8): 127 -> -127
// gas Yul: 22547
// gas YulOptimized: 22050
// negate_s16(int16): -32768 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 22515
// gas YulOptimized: 22239
// negate_s16(int16): -32767 -> 32767
// gas Yul: 22951
// gas YulOptimized: 22454
