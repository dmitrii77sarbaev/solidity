pragma abicoder               v2;

struct S { uint256 v; string s; }

contract A
{
	function test() external virtual returns (uint256 v, string memory s)
	{
	    v = 42;
	    s = "test";
	}
}
contract X is A
{
	S public override test;

	function set() public { test.v = 2; test.s = "statevar"; }
}


// ====
// compileViaYul: also
// ----
// test() -> 0, 64, 0
// gas Legacy: 24576
// gas LegacyOptimized: 24223
// gas Yul: 24558
// gas YulOptimized: 23653
// set() ->
// gas Legacy: 62499
// gas LegacyOptimized: 62463
// gas Yul: 64833
// gas YulOptimized: 62593
// test() -> 2, 0x40, 8, "statevar"
// gas Legacy: 25545
// gas LegacyOptimized: 25202
// gas Yul: 24655
// gas YulOptimized: 23768
