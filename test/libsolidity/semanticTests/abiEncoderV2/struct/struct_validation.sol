pragma abicoder               v2;

contract C {
	struct S { int16 a; uint8 b; bytes2 c; }
	function f(S memory s) public pure returns (uint a, uint b, uint c) {
		assembly {
			a := mload(s)
			b := mload(add(s, 0x20))
			c := mload(add(s, 0x40))
		}
	}
}
// ====
// compileViaYul: also
// ----
// f((int16,uint8,bytes2)): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff01, 0xff, "ab" -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff01, 0xff, "ab"
// gas Legacy: 23407
// gas LegacyOptimized: 22498
// gas Yul: 23740
// gas YulOptimized: 22663
// f((int16,uint8,bytes2)): 0xff010, 0xff, "ab" -> FAILURE
// gas Legacy: 22142
// gas LegacyOptimized: 21780
// gas Yul: 22170
// gas YulOptimized: 21826
// f((int16,uint8,bytes2)): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff01, 0xff0002, "ab" -> FAILURE
// gas Legacy: 22686
// gas LegacyOptimized: 22193
// gas Yul: 22718
// gas YulOptimized: 22244
// f((int16,uint8,bytes2)): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff01, 0xff, "abcd" -> FAILURE
// gas Legacy: 22879
// gas LegacyOptimized: 22294
// gas Yul: 22921
// gas YulOptimized: 22323
