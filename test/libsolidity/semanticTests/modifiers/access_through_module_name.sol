==== Source: a ====
import "a" as M;
contract C {
    uint public x;
    modifier m { x = 1; _; }

    function f() public M.M.C.m returns (uint t, uint r) {
        t = x;
        x = 3;
        r = 9;
    }
    function g() public m returns (uint t, uint r) {
        t = x;
        x = 4;
        r = 10;
    }
}
// ====
// compileViaYul: also
// ----
// x() -> 0x00
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// f() -> 1, 9
// gas Legacy: 43143
// gas LegacyOptimized: 41322
// gas Yul: 46339
// gas YulOptimized: 42347
// x() -> 3
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// g() -> 1, 0x0a
// gas Legacy: 23965
// gas LegacyOptimized: 22144
// gas Yul: 27161
// gas YulOptimized: 23169
// x() -> 4
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// f() -> 1, 9
// gas Legacy: 23943
// gas LegacyOptimized: 22122
// gas Yul: 27139
// gas YulOptimized: 23147
// x() -> 3
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
