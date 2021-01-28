contract A
{
	function test() external virtual returns (uint256)
	{
		return 5;
	}
}
contract X is A
{
	uint256 public override test;

	function set() public { test = 2; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() -> 0
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22230
// set() ->
// gas Legacy: 41200
// gas LegacyOptimized: 41192
// gas Yul: 42803
// gas YulOptimized: 41332
// test() -> 2
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22230
