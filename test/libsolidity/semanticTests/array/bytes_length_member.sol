contract c {
    function set() public returns (bool) {
        data = msg.data;
        return true;
    }

    function getLength() public returns (uint256) {
        return data.length;
    }

    bytes data;
}
// ====
// compileViaYul: also
// ----
// getLength() -> 0
// gas Legacy: 22337
// gas LegacyOptimized: 22225
// gas Yul: 22767
// gas YulOptimized: 22394
// set(): 1, 2 -> true
// gas Legacy: 103126
// gas LegacyOptimized: 102998
// gas Yul: 103792
// gas YulOptimized: 103213
// getLength() -> 68
// gas Legacy: 22323
// gas LegacyOptimized: 22211
// gas Yul: 22753
// gas YulOptimized: 22380
