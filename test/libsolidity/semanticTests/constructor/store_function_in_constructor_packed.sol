contract C {
    uint16 public result_in_constructor;
    function(uint16) returns (uint16) internal x;
    uint16 public other = 0x1fff;

    constructor() {
        x = doubleInv;
        result_in_constructor = use(2);
    }

    function doubleInv(uint16 _arg) public returns (uint16 _ret) {
        _ret = ~(_arg * 2);
    }

    function use(uint16 _arg) public returns (uint16) {
        return x(_arg);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// use(uint16): 3 -> 0xfff9
// gas Legacy: 23039
// gas LegacyOptimized: 22677
// gas Yul: 23682
// gas YulOptimized: 22751
// result_in_constructor() -> 0xfffb
// gas Legacy: 22210
// gas LegacyOptimized: 22088
// gas Yul: 22734
// gas YulOptimized: 22252
// other() -> 0x1fff
// gas Legacy: 22307
// gas LegacyOptimized: 22149
// gas Yul: 22778
// gas YulOptimized: 22302
