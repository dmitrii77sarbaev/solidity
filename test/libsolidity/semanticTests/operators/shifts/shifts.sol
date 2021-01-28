contract C {
    function f(uint x) public returns (uint y) {
        assembly { y := shl(2, x) }
    }
}
// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// f(uint256): 7 -> 28
// gas Legacy: 21790
// gas LegacyOptimized: 21490
// gas Yul: 22089
// gas YulOptimized: 21375
