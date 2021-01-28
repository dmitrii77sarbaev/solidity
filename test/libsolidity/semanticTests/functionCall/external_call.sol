pragma solidity >= 0.6.0;

contract C {
    function g(uint n) external pure returns (uint) {
        return n + 1;
    }

    function f(uint n) public view returns (uint) {
        return this.g(2 * n);
    }
}

// ====
// compileViaYul: also
// ----
// g(uint256): 4 -> 5
// gas Legacy: 22000
// gas LegacyOptimized: 21586
// gas Yul: 22388
// gas YulOptimized: 21733
// f(uint256): 2 -> 5
// gas Legacy: 24763
// gas LegacyOptimized: 23672
// gas Yul: 25888
// gas YulOptimized: 23895
