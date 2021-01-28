contract C {
	function create(uint256 len) public returns (uint256)
	{
		uint[] memory array = new uint[](len);
		return array.length;
	}
}
// ====
// compileViaYul: also
// ----
// create(uint256): 0 -> 0
// gas Legacy: 21874
// gas LegacyOptimized: 21579
// gas Yul: 22709
// gas YulOptimized: 21807
// create(uint256): 7 -> 7
// gas Legacy: 21980
// gas LegacyOptimized: 21672
// gas Yul: 22763
// gas YulOptimized: 21861
// create(uint256): 10 -> 10
// gas Legacy: 21998
// gas LegacyOptimized: 21690
// gas Yul: 22781
// gas YulOptimized: 21879
