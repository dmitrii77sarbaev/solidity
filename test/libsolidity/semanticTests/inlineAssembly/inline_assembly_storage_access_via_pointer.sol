contract C {
    struct Data {
        uint256 contents;
    }
    uint256 public separator;
    Data public a;
    uint256 public separator2;

    function f() public returns (bool) {
        Data storage x = a;
        uint256 off;
        assembly {
            sstore(x.slot, 7)
            off := x.offset
        }
        assert(off == 0);
        return true;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 41462
// gas LegacyOptimized: 41307
// gas Yul: 42092
// gas YulOptimized: 41510
// a() -> 7
// gas Legacy: 22185
// gas LegacyOptimized: 22070
// gas Yul: 22705
// gas YulOptimized: 22240
// separator() -> 0
// gas Legacy: 22237
// gas LegacyOptimized: 22136
// gas Yul: 22788
// gas YulOptimized: 22306
// separator2() -> 0
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22284
