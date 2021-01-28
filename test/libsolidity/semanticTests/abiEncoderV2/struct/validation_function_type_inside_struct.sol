pragma abicoder               v2;

contract C {
    struct S { function () external x; }
    function f(S memory) public pure returns (uint r) { r = 1; }
    function g(S calldata) external pure returns (uint r) { r = 2; }
    function h(S calldata s) external pure returns (uint r) { s.x; r = 3; }
}
// ====
// compileViaYul: also
// ----
// f((function)): "01234567890123456789abcd" -> 1
// gas Legacy: 22493
// gas LegacyOptimized: 21949
// gas Yul: 22885
// gas YulOptimized: 22129
// f((function)): "01234567890123456789abcdX" -> FAILURE
// gas Legacy: 22199
// gas LegacyOptimized: 21812
// gas Yul: 22232
// gas YulOptimized: 21883
// g((function)): "01234567890123456789abcd" -> 2
// gas Legacy: 22016
// gas LegacyOptimized: 21784
// gas Yul: 22396
// gas YulOptimized: 21894
// g((function)): "01234567890123456789abcdX" -> 2
// gas Legacy: 22028
// gas LegacyOptimized: 21796
// gas Yul: 22408
// gas YulOptimized: 21906
// h((function)): "01234567890123456789abcd" -> 3
// gas Legacy: 22544
// gas LegacyOptimized: 21970
// gas Yul: 22772
// gas YulOptimized: 21985
// h((function)): "01234567890123456789abcdX" -> FAILURE
// gas Legacy: 22094
// gas LegacyOptimized: 21808
// gas Yul: 22052
// gas YulOptimized: 21759
