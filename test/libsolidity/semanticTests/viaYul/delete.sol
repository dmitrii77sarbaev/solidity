contract C {
	function internal_func() internal pure returns (int8)
	{
		return 1;
	}
	function call_internal_func() public pure returns (bool ret)
	{
		function() internal pure returns(int8) func = internal_func;

		return func() == internal_func();
	}
	function call_deleted_internal_func() public pure returns (bool ret)
	{
		function() internal pure returns(int8) func = internal_func;

		delete func;

		return func() == internal_func();
	}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// call_deleted_internal_func() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 21290
// gas LegacyOptimized: 21272
// gas Yul: 21473
// gas YulOptimized: 21279
// call_internal_func() -> true
// gas Legacy: 21518
// gas LegacyOptimized: 21393
// gas Yul: 22329
// gas YulOptimized: 21555
