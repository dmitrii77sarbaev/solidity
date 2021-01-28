contract C {
    uint16 x;
    uint16 public y;
    uint256 public z;

    function f() public returns (bool) {
        uint256 off1;
        uint256 off2;
        assembly {
            sstore(z.slot, 7)
            off1 := z.offset
            off2 := y.offset
        }
        assert(off1 == 0);
        assert(off2 == 2);
        return true;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 41463
// gas LegacyOptimized: 41285
// gas Yul: 42233
// gas YulOptimized: 41488
// z() -> 7
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22284
