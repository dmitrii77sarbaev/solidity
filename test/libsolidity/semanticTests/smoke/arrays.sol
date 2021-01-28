pragma abicoder               v2;

contract C {
    struct T {
        uint a;
        uint b;
        string s;
    }
    bool[2][] flags;
    function r() public returns (bool[3] memory) {
        return [true, false, true];
    }
    function s() public returns (uint[2] memory, uint) {
        return ([uint(123), 456], 789);
    }
    function u() public returns (T[2] memory) {
        return [T(23, 42, "any"), T(555, 666, "any")];
    }
    function v() public returns (bool[2][] memory) {
        return flags;
    }
    function w1() public returns (string[1] memory) {
        return ["any"];
    }
    function w2() public returns (string[2] memory) {
        return ["any", "any"];
    }
    function w3() public returns (string[3] memory) {
        return ["any", "any", "any"];
    }
    function x() public returns (string[2] memory, string[3] memory) {
        return (["any", "any"], ["any", "any", "any"]);
    }
}
// ====
// compileViaYul: also
// ----
// r() -> true, false, true
// gas Legacy: 22623
// gas LegacyOptimized: 21839
// gas Yul: 23969
// gas YulOptimized: 22223
// s() -> 123, 456, 789
// gas Legacy: 22369
// gas LegacyOptimized: 21712
// gas Yul: 24053
// gas YulOptimized: 22184
// u() -> 0x20, 0x40, 0xE0, 23, 42, 0x60, 3, "any", 555, 666, 0x60, 3, "any"
// gas Legacy: 24256
// gas LegacyOptimized: 23012
// gas Yul: 28801
// gas YulOptimized: 24567
// v() -> 0x20, 0
// gas Legacy: 22589
// gas LegacyOptimized: 22391
// gas Yul: 23509
// gas YulOptimized: 22778
// w1() -> 0x20, 0x20, 3, "any"
// gas Legacy: 22446
// gas LegacyOptimized: 21884
// gas Yul: 24323
// gas YulOptimized: 22631
// w2() -> 0x20, 0x40, 0x80, 3, "any", 3, "any"
// gas Legacy: 23205
// gas LegacyOptimized: 22461
// gas Yul: 25595
// gas YulOptimized: 23230
// w3() -> 0x20, 0x60, 0xa0, 0xe0, 3, "any", 3, "any", 3, "any"
// gas Legacy: 24007
// gas LegacyOptimized: 22960
// gas Yul: 27088
// gas YulOptimized: 24018
// x() -> 0x40, 0x0100, 0x40, 0x80, 3, "any", 3, "any", 0x60, 0xa0, 0xe0, 3, "any", 3, "any", 3, "any"
// gas Legacy: 25902
// gas LegacyOptimized: 24113
// gas Yul: 30971
// gas YulOptimized: 25676
