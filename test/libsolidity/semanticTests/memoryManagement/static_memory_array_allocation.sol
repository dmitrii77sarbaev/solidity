contract C {
    function memorySize() internal pure returns (uint s) {
        assembly { s := mload(0x40) }
    }
    function withValue() public pure returns (uint) {
        uint[20] memory x;
        uint memorySizeBefore = memorySize();
        uint[20] memory t = x;
        uint memorySizeAfter = memorySize();
        return memorySizeAfter - memorySizeBefore;
    }
    function withoutValue() public pure returns (uint) {
        uint[20] memory x;
        uint memorySizeBefore = memorySize();
        uint[20] memory t;
        uint memorySizeAfter = memorySize();
        return memorySizeAfter - memorySizeBefore;
    }
}
// ====
// compileViaYul: also
// ----
// withValue() -> 0x00
// gas Legacy: 21907
// gas LegacyOptimized: 21647
// gas Yul: 22807
// gas YulOptimized: 21757
// withoutValue() -> 0x0280
// gas Legacy: 22142
// gas LegacyOptimized: 21868
// gas Yul: 23530
// gas YulOptimized: 22105
