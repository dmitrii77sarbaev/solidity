pragma abicoder               v2;

contract C {
    enum E { A, B }
    function f(E e) public pure returns (uint x) {
        assembly { x := e }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint8): 0 -> 0
// gas Legacy: 21729
// gas LegacyOptimized: 21500
// gas Yul: 22027
// gas YulOptimized: 21394
// f(uint8): 1 -> 1
// gas Legacy: 21741
// gas LegacyOptimized: 21512
// gas Yul: 22039
// gas YulOptimized: 21406
// f(uint8): 2 -> FAILURE
// gas Legacy: 21471
// gas LegacyOptimized: 21394
// gas Yul: 21497
// gas YulOptimized: 21379
// f(uint8): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> FAILURE
// gas Legacy: 21843
// gas LegacyOptimized: 21766
// gas Yul: 21869
// gas YulOptimized: 21751
