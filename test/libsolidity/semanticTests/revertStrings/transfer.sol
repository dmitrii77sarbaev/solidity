contract A {
	receive() external payable {
		revert("no_receive");
	}
}

contract C {
	A a = new A();
	receive() external payable {}
	function f() public {
		payable(a).transfer(1 wei);
	}
	function h() public {
		payable(a).transfer(100 ether);
	}
	function g() public view returns (uint) {
		return payable(this).balance;
	}
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// revertStrings: debug
// ----
// (), 10 wei ->
// gas Legacy: 21055
// gas LegacyOptimized: 21055
// gas Yul: 21067
// gas YulOptimized: 21070
// g() -> 10
// gas Legacy: 21425
// gas LegacyOptimized: 21316
// gas Yul: 22848
// gas YulOptimized: 21489
// f() -> FAILURE, hex"08c379a0", 0x20, 10, "no_receive"
// gas Legacy: 29874
// gas LegacyOptimized: 29687
// gas Yul: 30741
// gas YulOptimized: 29644
// h() -> FAILURE
// gas Legacy: 29549
// gas LegacyOptimized: 29517
// gas Yul: 30333
// gas YulOptimized: 29549
