contract C {
    struct S { uint x; uint y; uint z; }
    function memorySize() internal pure returns (uint s) {
        assembly { s := mload(0x40) }
    }
    function withValue() public pure returns (uint) {
        S memory x = S(1, 2, 3);
        uint memorySizeBefore = memorySize();
        S memory t = x;
        uint memorySizeAfter = memorySize();
        return memorySizeAfter - memorySizeBefore;
    }
    function withoutValue() public pure returns (uint) {
        uint memorySizeBefore = memorySize();
        S memory t;
        uint memorySizeAfter = memorySize();
        return memorySizeAfter - memorySizeBefore;
    }
}
// ====
// compileViaYul: also
// ----
// withValue() -> 0x00
// gas Legacy: 21766
// gas LegacyOptimized: 21517
// gas Yul: 22943
// gas YulOptimized: 21673
// withoutValue() -> 0x60
// gas Legacy: 21794
// gas LegacyOptimized: 21553
// gas Yul: 22686
// gas YulOptimized: 21763
