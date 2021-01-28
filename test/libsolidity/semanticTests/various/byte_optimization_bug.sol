contract C {
    function f(uint256 x) public returns (uint256 a) {
        assembly {
            a := byte(x, 31)
        }
    }

    function g(uint256 x) public returns (uint256 a) {
        assembly {
            a := byte(31, x)
        }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 2 -> 0
// gas Legacy: 21790
// gas LegacyOptimized: 21493
// gas Yul: 22090
// gas YulOptimized: 21493
// g(uint256): 2 -> 2
// gas Legacy: 21812
// gas LegacyOptimized: 21512
// gas Yul: 22112
// gas YulOptimized: 21625
