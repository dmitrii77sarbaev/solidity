contract C {
	mapping (string => uint) map;
	function set(string memory s) public {
		map[s];
	}
}
// ====
// compileViaYul: also
// ----
// set(string): 0x20, 32, "01234567890123456789012345678901" ->
// gas Legacy: 23268
// gas LegacyOptimized: 22588
// gas Yul: 23861
// gas YulOptimized: 22689
