contract A {
	function g() public { revert("fail"); }
}

contract C {
	A a = new A();
	function f() public {
		a.g();
	}
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// revertStrings: debug
// ----
// f() -> FAILURE, hex"08c379a0", 0x20, 4, "fail"
// gas Legacy: 23980
// gas LegacyOptimized: 23825
// gas Yul: 24676
// gas YulOptimized: 23858
