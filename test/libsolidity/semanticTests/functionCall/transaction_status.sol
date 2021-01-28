contract test {
	function f() public { }
	function g() public { revert(); }
	function h() public { assert(false); }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() ->
// gas Legacy: 21186
// gas LegacyOptimized: 21186
// gas Yul: 21573
// gas YulOptimized: 21326
// g() -> FAILURE
// gas Legacy: 21227
// gas LegacyOptimized: 21227
// gas Yul: 21338
// gas YulOptimized: 21297
// h() -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 21239
// gas LegacyOptimized: 21229
// gas Yul: 21395
// gas YulOptimized: 21299
