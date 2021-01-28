contract D { constructor() payable {} }
contract C {
	uint public x;
	constructor() payable {}
	function f(uint amount) public returns (D) {
		x++;
		return (new D){value: amount}();
	}
	function stack(uint depth) public payable returns (address) {
		if (depth > 0)
			return this.stack(depth - 1);
		else
			return address(f(0));
	}
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// constructor(), 20 wei
// gas Legacy: 326322
// gas LegacyOptimized: 223954
// gas Yul: 437069
// gas YulOptimized: 232551
// f(uint256): 20 -> 1370859564726510389319704988634906228201275401179
// gas Legacy: 95838
// gas LegacyOptimized: 95416
// gas Yul: 86902
// gas YulOptimized: 76724
// x() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22275
// f(uint256): 20 -> FAILURE
// gas Legacy: 55513
// gas LegacyOptimized: 55259
// gas Yul: 56953
// gas YulOptimized: 55217
// x() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22275
// stack(uint256): 1023 -> FAILURE
// gas Legacy: 981671
// gas LegacyOptimized: 831459
// gas Yul: 1162959
// gas YulOptimized: 835314
// x() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22275
// stack(uint256): 10 -> 693016686122178122849713379390321835634789309880
// gas Legacy: 105653
// gas LegacyOptimized: 98169
// gas Yul: 106194
// gas YulOptimized: 82064
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22275
