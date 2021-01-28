contract C {
    uint16 x;
    uint16 public y;
    uint256 public z;

    function f() public returns (bool) {
        uint256 off1;
        uint256 off2;
        assembly {
            function f() -> o1 {
                sstore(z.slot, 7)
                o1 := y.offset
            }
            off2 := f()
        }
        assert(off2 == 2);
        return true;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 41479
// gas LegacyOptimized: 41370
// gas Yul: 42070
// gas YulOptimized: 41488
// z() -> 7
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22284
