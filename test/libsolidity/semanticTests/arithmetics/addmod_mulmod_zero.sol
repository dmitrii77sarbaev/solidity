contract C {
    function f(uint256 d) public pure returns (uint256) {
        addmod(1, 2, d);
        return 2;
    }

    function g(uint256 d) public pure returns (uint256) {
        mulmod(1, 2, d);
        return 2;
    }

    function h() public pure returns (uint256) {
        mulmod(0, 1, 2);
        mulmod(1, 0, 2);
        addmod(0, 1, 2);
        addmod(1, 0, 2);
        return 2;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 21611
// gas LegacyOptimized: 21434
// gas Yul: 21708
// gas YulOptimized: 21450
// g(uint256): 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 21655
// gas LegacyOptimized: 21478
// gas Yul: 21752
// gas YulOptimized: 21494
// h() -> 2
// gas Legacy: 21489
// gas LegacyOptimized: 21292
// gas Yul: 22315
// gas YulOptimized: 21459
