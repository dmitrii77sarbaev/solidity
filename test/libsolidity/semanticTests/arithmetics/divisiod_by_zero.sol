contract C {
    function div(uint256 a, uint256 b) public returns (uint256) {
        return a / b;
    }

    function mod(uint256 a, uint256 b) public returns (uint256) {
        return a % b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// div(uint256,uint256): 7, 2 -> 3
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// div(uint256,uint256): 7, 0 -> FAILURE, hex"4e487b71", 0x12 # throws #
// gas Legacy: 22066
// gas LegacyOptimized: 21633
// gas Yul: 22157
// gas YulOptimized: 21565
// mod(uint256,uint256): 7, 2 -> 1
// gas Legacy: 22300
// gas LegacyOptimized: 21741
// gas Yul: 22613
// gas YulOptimized: 21872
// mod(uint256,uint256): 7, 0 -> FAILURE, hex"4e487b71", 0x12 # throws #
// gas Legacy: 22088
// gas LegacyOptimized: 21655
// gas Yul: 22179
// gas YulOptimized: 21656
