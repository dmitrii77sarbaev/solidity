contract C {
    function f(int16[] calldata a) external returns (bool correct) {
        uint32 x = uint32(uint16(a[1]));
        uint r;
        assembly {
            r := x
        }
        correct = r == 0x7fff;
    }
}
// ====
// compileViaYul: also
// ----
// f(int16[]): 0x20, 0x02, 0x7fff, 0x7fff -> true
// gas Legacy: 22645
// gas LegacyOptimized: 22323
// gas Yul: 23346
// gas YulOptimized: 22305
