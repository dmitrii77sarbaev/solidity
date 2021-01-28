contract C {
    uint256[] public a;

    function f() public returns (uint256) {
        uint256[] storage x = a;
        uint256 off;
        assembly {
            sstore(x.slot, 7)
            off := x.offset
        }
        assert(off == 0);
        return a.length;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 7
// gas Legacy: 42242
// gas LegacyOptimized: 41279
// gas Yul: 42872
// gas YulOptimized: 41411
