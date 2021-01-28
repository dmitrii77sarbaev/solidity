contract A1 { constructor() {} }
contract B1 is A1 {}

contract A2 { constructor() payable {} }
contract B2 is A2 {}

contract B3 {}

contract B4 { constructor() {} }

contract C {
	function createWithValue(bytes memory c, uint256 value) public payable returns (bool) {
		uint256 y = 0;
		assembly { y := create(value, add(c, 0x20), mload(c)) }
		return y != 0;
	}
	function f(uint256 value) public payable returns (bool) {
		return createWithValue(type(B1).creationCode, value);
	}
	function g(uint256 value) public payable returns (bool) {
		return createWithValue(type(B2).creationCode, value);
	}
	function h(uint256 value) public payable returns (bool) {
		return createWithValue(type(B3).creationCode, value);
	}
	function i(uint256 value) public payable returns (bool) {
		return createWithValue(type(B4).creationCode, value);
	}
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256), 2000 ether: 0 -> true
// gas Legacy: 74906
// gas LegacyOptimized: 74604
// gas Yul: 65013
// gas YulOptimized: 55922
// f(uint256), 2000 ether: 100 -> false
// gas Legacy: 54088
// gas LegacyOptimized: 53786
// gas Yul: 54806
// gas YulOptimized: 53915
// g(uint256), 2000 ether: 0 -> true
// gas Legacy: 74950
// gas LegacyOptimized: 74648
// gas Yul: 65057
// gas YulOptimized: 55966
// g(uint256), 2000 ether: 100 -> false
// gas Legacy: 54132
// gas LegacyOptimized: 53830
// gas Yul: 54850
// gas YulOptimized: 53959
// h(uint256), 2000 ether: 0 -> true
// gas Legacy: 74928
// gas LegacyOptimized: 74626
// gas Yul: 65035
// gas YulOptimized: 55944
// h(uint256), 2000 ether: 100 -> false
// gas Legacy: 54110
// gas LegacyOptimized: 53808
// gas Yul: 54828
// gas YulOptimized: 53937
// i(uint256), 2000 ether: 0 -> true
// gas Legacy: 74884
// gas LegacyOptimized: 74582
// gas Yul: 64991
// gas YulOptimized: 55900
// i(uint256), 2000 ether: 100 -> false
// gas Legacy: 54066
// gas LegacyOptimized: 53764
// gas Yul: 54784
// gas YulOptimized: 53893
