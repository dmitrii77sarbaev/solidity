contract C {
	function conv(bytes25 a) public pure returns (bytes32) {
		// truncating and widening
		return ~bytes32(bytes16(~a));
	}

	function upcast(bytes25 a) public pure returns (bytes32) {
		// implicit widening is allowed
		return ~a;
	}

	function downcast(bytes25 a) public pure returns (bytes12) {
		// truncating cast must be explicit
		return bytes12(~a);
	}

	function r_b32() public pure returns (bytes32) {
		return ~bytes32(hex"ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00");
	}
	function r_b25() public pure returns (bytes25) {
		return ~bytes25(hex"ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff");
	}
	function r_b16() public pure returns (bytes16) {
		return ~bytes16(hex"ff00ff00ff00ff00ff00ff00ff00ff00");
	}
	function r_b8() public pure returns (bytes8) {
		return ~bytes8(hex"ff00ff00ff00ff00");
	}
	function r_b4() public pure returns (bytes4) {
		return ~bytes4(hex"ff00ff00");
	}
	function r_b1() public pure returns (bytes1) {
		return ~bytes1(hex"55");
	}

	function a_b32() public pure returns (bytes32) {
		bytes32 r = ~bytes32(hex"ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00");
		return r;
	}
	function a_b25() public pure returns (bytes25) {
		bytes25 r = ~bytes25(hex"ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff");
		return r;
	}
	function a_b16() public pure returns (bytes16) {
		bytes16 r =  ~bytes16(hex"ff00ff00ff00ff00ff00ff00ff00ff00");
		return r;
	}
	function a_b8() public pure returns (bytes8) {
		bytes8 r =  ~bytes8(hex"ff00ff00ff00ff00");
		return r;
	}
	function a_b4() public pure returns (bytes4) {
		bytes4 r =  ~bytes4(hex"ff00ff00");
		return r;
	}
	function a_b1() public pure returns (bytes1) {
		bytes1 r =  ~bytes1(hex"55");
		return r;
	}
}
// ====
// compileViaYul: also
// ----
// conv(bytes25): left(0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff) -> 0xff00ff00ff00ff00ff00ff00ff00ff00ffffffffffffffffffffffffffffffff
// gas Legacy: 22038
// gas LegacyOptimized: 21781
// gas Yul: 22732
// gas YulOptimized: 22044
// upcast(bytes25): left(0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff) -> 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff0000000000000000
// gas Legacy: 21990
// gas LegacyOptimized: 21721
// gas Yul: 22632
// gas YulOptimized: 22085
// downcast(bytes25): left(0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff) -> 0xff00ff00ff00ff00ff00ff0000000000000000000000000000000000000000
// gas Legacy: 22053
// gas LegacyOptimized: 21805
// gas Yul: 22710
// gas YulOptimized: 22163
// r_b32() -> 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff
// gas Legacy: 21427
// gas LegacyOptimized: 21315
// gas Yul: 21910
// gas YulOptimized: 21506
// r_b25() -> 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff0000000000000000
// gas Legacy: 21478
// gas LegacyOptimized: 21375
// gas Yul: 21906
// gas YulOptimized: 21493
// r_b16() -> 0xff00ff00ff00ff00ff00ff00ff00ff00000000000000000000000000000000
// gas Legacy: 21476
// gas LegacyOptimized: 21385
// gas Yul: 22154
// gas YulOptimized: 21741
// r_b8() -> 0xff00ff00ff00ff000000000000000000000000000000000000000000000000
// gas Legacy: 21477
// gas LegacyOptimized: 21398
// gas Yul: 21984
// gas YulOptimized: 21568
// r_b4() -> 0xff00ff00000000000000000000000000000000000000000000000000000000
// gas Legacy: 21499
// gas LegacyOptimized: 21420
// gas Yul: 22094
// gas YulOptimized: 21678
// r_b1() -> 0xaa00000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21455
// gas LegacyOptimized: 21376
// gas Yul: 21962
// gas YulOptimized: 21546
// a_b32() -> 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff
// gas Legacy: 21462
// gas LegacyOptimized: 21337
// gas Yul: 22020
// gas YulOptimized: 21616
// a_b25() -> 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff0000000000000000
// gas Legacy: 21467
// gas LegacyOptimized: 21351
// gas Yul: 22126
// gas YulOptimized: 21713
// a_b16() -> 0xff00ff00ff00ff00ff00ff00ff00ff00000000000000000000000000000000
// gas Legacy: 21446
// gas LegacyOptimized: 21342
// gas Yul: 22022
// gas YulOptimized: 21609
// a_b8() -> 0xff00ff00ff00ff000000000000000000000000000000000000000000000000
// gas Legacy: 21469
// gas LegacyOptimized: 21377
// gas Yul: 21896
// gas YulOptimized: 21480
// a_b4() -> 0xff00ff00000000000000000000000000000000000000000000000000000000
// gas Legacy: 21447
// gas LegacyOptimized: 21355
// gas Yul: 21874
// gas YulOptimized: 21458
// a_b1() -> 0xaa00000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21512
// gas LegacyOptimized: 21420
// gas Yul: 22006
// gas YulOptimized: 21590
