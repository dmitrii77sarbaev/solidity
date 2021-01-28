pragma abicoder               v2;

contract C {
	function f(bool b) public pure returns (bool) { return b; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> true
// gas Legacy: 21796
// gas LegacyOptimized: 21524
// gas Yul: 22095
// gas YulOptimized: 21417
// f(bool): false -> false
// gas Legacy: 21784
// gas LegacyOptimized: 21512
// gas Yul: 22083
// gas YulOptimized: 21405
// f(bool): 0x000000 -> false
// gas Legacy: 21784
// gas LegacyOptimized: 21512
// gas Yul: 22083
// gas YulOptimized: 21405
// f(bool): 0xffffff -> FAILURE
// gas Legacy: 21544
// gas LegacyOptimized: 21424
// gas Yul: 21571
// gas YulOptimized: 21412
