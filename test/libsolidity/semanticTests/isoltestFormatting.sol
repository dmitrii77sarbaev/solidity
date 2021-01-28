contract C {
    function f() public returns (uint[5] memory) {
        uint[5] memory a = [4, 11, 0x111, uint(3355443), 2222222222222222222];
        return a;
    }
    function g() public returns (uint[5] memory) {
        uint[5] memory a = [16, 256, 257, uint(0x333333), 0x1ed6eb565788e38e];
        return a;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 4, 11, 0x0111, 0x333333, 2222222222222222222
// gas Legacy: 23097
// gas LegacyOptimized: 21972
// gas Yul: 25069
// gas YulOptimized: 22311
// g() -> 0x10, 0x0100, 0x0101, 0x333333, 2222222222222222222
// gas Legacy: 23119
// gas LegacyOptimized: 21994
// gas Yul: 25091
// gas YulOptimized: 22411
