pragma solidity >= 0.6.0;

contract C {
    function g(uint n) external payable returns (uint, uint) {
        return (msg.value * 1000, n);
    }

    function f(uint n) public payable returns (uint, uint) {
        return this.g{value: 10}(n);
    }
}

// ====
// compileViaYul: also
// ----
// g(uint256), 1 ether: 4 -> 1000000000000000000000, 4
// gas Legacy: 22102
// gas LegacyOptimized: 21604
// gas Yul: 22505
// gas YulOptimized: 21775
// f(uint256), 11 ether: 2 -> 10000, 2
// gas Legacy: 31621
// gas LegacyOptimized: 30355
// gas Yul: 32788
// gas YulOptimized: 30550
