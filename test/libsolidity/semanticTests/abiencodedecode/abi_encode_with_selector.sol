pragma abicoder v1;
contract C {
	function f0() public pure returns (bytes memory) {
		return abi.encodeWithSelector(0x12345678);
	}
	function f1() public pure returns (bytes memory) {
		return abi.encodeWithSelector(0x12345678, "abc");
	}
	function f2() public pure returns (bytes memory) {
		bytes4 x = 0x12345678;
		return abi.encodeWithSelector(x, "abc");
	}
	function f3() public pure returns (bytes memory) {
		bytes4 x = 0x12345678;
		return abi.encodeWithSelector(x, type(uint).max);
	}
}
// ====
// compileViaYul: also
// ----
// f0() -> 0x20, 4, 8234104107246695022420661102507966550300666591269321702959126607540084801536
// gas Legacy: 21734
// gas LegacyOptimized: 21696
// gas Yul: 22621
// gas YulOptimized: 21910
// f1() -> 0x20, 0x64, 8234104107246695022420661102507966550300666591269321702959126607540084801536, 862718293348820473429344482784628181556388621521298319395315527974912, 91135606241822717681769169345594720818313984248279388438121731325952, 0
// gas Legacy: 22090
// gas LegacyOptimized: 22052
// gas Yul: 23107
// gas YulOptimized: 22281
// f2() -> 0x20, 0x64, 8234104107246695022420661102507966550300666591269321702959126607540084801536, 862718293348820473429344482784628181556388621521298319395315527974912, 91135606241822717681769169345594720818313984248279388438121731325952, 0
// gas Legacy: 22046
// gas LegacyOptimized: 21986
// gas Yul: 23041
// gas YulOptimized: 22215
// f3() -> 0x20, 0x24, 0x12345678ffffffffffffffffffffffffffffffffffffffffffffffffffffffff, -26959946667150639794667015087019630673637144422540572481103610249216
// gas Legacy: 21887
// gas LegacyOptimized: 21845
// gas Yul: 22827
// gas YulOptimized: 22044
