pragma abicoder               v2;

struct S { uint256 v; string s; }

contract A
{
	function test(uint256 x) external virtual returns (uint256 v, string memory s)
	{
	    v = x;
	    s = "test";
	}
}
contract X is A
{
	mapping(uint256 => S) public override test;

	function set() public { test[42].v = 2; test[42].s = "statevar"; }
}


// ====
// compileViaYul: also
// ----
// test(uint256): 0 -> 0, 64, 0
// gas Legacy: 25018
// gas LegacyOptimized: 24481
// gas Yul: 25057
// gas YulOptimized: 23751
// test(uint256): 42 -> 0, 64, 0
// gas Legacy: 25030
// gas LegacyOptimized: 24493
// gas Yul: 25069
// gas YulOptimized: 23763
// set() ->
// gas Legacy: 62677
// gas LegacyOptimized: 62509
// gas Yul: 65255
// gas YulOptimized: 62934
// test(uint256): 0 -> 0, 64, 0
// gas Legacy: 25018
// gas LegacyOptimized: 24481
// gas Yul: 25057
// gas YulOptimized: 23751
// test(uint256): 42 -> 2, 0x40, 8, "statevar"
// gas Legacy: 25999
// gas LegacyOptimized: 25472
// gas Yul: 25166
// gas YulOptimized: 23878
