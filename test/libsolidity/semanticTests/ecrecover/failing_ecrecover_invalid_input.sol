contract C {
    // ecrecover should return zero for malformed input
	// (v should be 27 or 28, not 1)
	// Note that the precompile does not return zero but returns nothing.
    function f() public returns (address) {
        return ecrecover(bytes32(type(uint256).max), 1, bytes32(uint(2)), bytes32(uint(3)));
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0
// gas Legacy: 22774
// gas LegacyOptimized: 22267
// gas Yul: 23789
// gas YulOptimized: 22222
