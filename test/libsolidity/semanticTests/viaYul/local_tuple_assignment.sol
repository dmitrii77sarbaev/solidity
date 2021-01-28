contract C {
    uint public x = 17;
    function f(uint a1, uint a2) public returns (uint r1, uint r2) {
        (uint b1, uint b2) = (a1, a2);
        (r1, x, r2) = (b1, b2, b2);
    }
    function g() public returns (uint a, uint b, uint c) {
        uint256[3] memory m;
        (m[0], m[1], m[2]) = (1, x, 3);
        return (m[2], m[1], m[0]);
    }
    function h() public returns (uint a, uint b, uint c) {
        uint256[3] memory m;
        (m[0], m[1], , m[2], m[0]) = (1, x, 3, 4, 42);
        return (m[2], m[1], m[0]);
    }
    function i() public returns (uint a, uint b, uint c, uint d) {
        (a) = 42;
        (((((b))))) = 23;
        c = (((17)));
        (((d))) = (13);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// x() -> 17
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22243
// f(uint256,uint256): 23, 42 -> 23, 42
// gas Legacy: 23091
// gas LegacyOptimized: 22499
// gas Yul: 24470
// gas YulOptimized: 22614
// x() -> 42
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22243
// g() -> 3, 42, 1
// gas Legacy: 22883
// gas LegacyOptimized: 22479
// gas Yul: 25900
// gas YulOptimized: 23184
// h() -> 4, 42, 1
// gas Legacy: 22928
// gas LegacyOptimized: 22388
// gas Yul: 26304
// gas YulOptimized: 23263
// i() -> 42, 23, 17, 13
// gas Legacy: 21809
// gas LegacyOptimized: 21439
// gas Yul: 22573
// gas YulOptimized: 21678
