pragma abicoder               v2;

contract C {
    function f(uint16 a, int16 b, address c, bytes3 d, bool e)
            public pure returns (uint v, uint w, uint x, uint y, uint z) {
        assembly { v := a  w := b x := c y := d z := e}
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint16,int16,address,bytes3,bool): 1, 2, 3, "a", true -> 1, 2, 3, "a", true
// gas Legacy: 23567
// gas LegacyOptimized: 22470
// gas Yul: 23956
// gas YulOptimized: 22509
// f(uint16,int16,address,bytes3,bool): 0xffffff, 0x1ffff, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "abcd", 1 -> FAILURE
// gas Legacy: 22548
// gas LegacyOptimized: 22428
// gas Yul: 22572
// gas YulOptimized: 22401
// f(uint16,int16,address,bytes3,bool): 0xffffff, 0, 0, "bcd", 1 -> FAILURE
// gas Legacy: 22116
// gas LegacyOptimized: 21996
// gas Yul: 22140
// gas YulOptimized: 21969
// f(uint16,int16,address,bytes3,bool): 0, 0x1ffff, 0, "ab", 1 -> FAILURE
// gas Legacy: 22277
// gas LegacyOptimized: 22035
// gas Yul: 22305
// gas YulOptimized: 22000
// f(uint16,int16,address,bytes3,bool): 0, 0, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "ad", 1 -> FAILURE
// gas Legacy: 22839
// gas LegacyOptimized: 22441
// gas Yul: 22884
// gas YulOptimized: 22401
// f(uint16,int16,address,bytes3,bool): 0, 0, 0, "abcd", 1 -> FAILURE
// gas Legacy: 22650
// gas LegacyOptimized: 22142
// gas Yul: 22705
// gas YulOptimized: 22114
// f(uint16,int16,address,bytes3,bool): 0, 0, 0, "abc", 2 -> FAILURE
// gas Legacy: 22809
// gas LegacyOptimized: 22194
// gas Yul: 22868
// gas YulOptimized: 22187
