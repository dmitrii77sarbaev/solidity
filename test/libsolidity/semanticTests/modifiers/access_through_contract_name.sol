contract A {
    uint public x = 7;
    modifier m virtual { x = 2; _; }
}
contract C is A {
    modifier m override { x = 1; _; }

    function f() public A.m returns (uint) {
        return 9;
    }
    function g() public m returns (uint) {
        return 10;
    }
}
// ====
// compileViaYul: also
// ----
// x() -> 7
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// f() -> 9
// gas Legacy: 22215
// gas LegacyOptimized: 22098
// gas Yul: 23980
// gas YulOptimized: 22304
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// g() -> 0x0a
// gas Legacy: 22237
// gas LegacyOptimized: 22120
// gas Yul: 24002
// gas YulOptimized: 22326
// x() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// f() -> 9
// gas Legacy: 22215
// gas LegacyOptimized: 22098
// gas Yul: 23980
// gas YulOptimized: 22304
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
