contract A {
	uint immutable a;
	constructor() {
		a = 7;
	}
	function f() public view returns (uint) { return a; }
}
contract B {
	uint immutable a;
	constructor() {
		a = 5;
	}
	function f() public view returns (uint) { return a; }
}
contract C {
	uint immutable a;
	uint public x;
	uint public y;
	constructor() {
		a = 3;
		x = (new A()).f();
		y = (new B()).f();
	}
	function f() public returns (uint256, uint, uint) {
		return (a, (new A()).f(), (new B()).f());
	}
}
// ====
// compileViaYul: also
// ----
// f() -> 3, 7, 5
// gas Legacy: 192053
// gas LegacyOptimized: 174038
// gas Yul: 133517
// gas YulOptimized: 133517
// x() -> 7
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22275
// gas YulOptimized: 22275
// y() -> 5
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22319
// gas YulOptimized: 22319
