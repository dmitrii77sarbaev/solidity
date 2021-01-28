pragma solidity >= 0.6.0;

contract C {
    function h(uint[4] memory n) public pure returns (uint) {
        return n[0] + n[1] + n[2] + n[3];
    }

    function i(uint[4] memory n) public view returns (uint) {
        return this.h(n) * 2;
    }
}

// ====
// compileViaYul: also
// ----
// h(uint256[4]): 1, 2, 3, 4 -> 10
// gas Legacy: 24315
// gas LegacyOptimized: 22698
// gas Yul: 25749
// gas YulOptimized: 23396
// i(uint256[4]): 1, 2, 3, 4 -> 20
// gas Legacy: 29627
// gas LegacyOptimized: 25674
// gas Yul: 31809
// gas YulOptimized: 26740
