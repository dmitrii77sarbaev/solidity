contract TransferTest {
	fallback() external payable {
		// This used to cause an ICE
		payable(this).transfer;
	}

	function f() pure public {}
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() ->
// gas Legacy: 21186
// gas LegacyOptimized: 21174
// gas Yul: 21572
// gas YulOptimized: 21214
