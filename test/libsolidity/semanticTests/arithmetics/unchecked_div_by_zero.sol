contract C {
    function div(uint256 a, uint256 b) public returns (uint256) {
        // Does not disable div by zero check
        unchecked {
            return a / b;
        }
    }

    function mod(uint256 a, uint256 b) public returns (uint256) {
        // Does not disable div by zero check
        unchecked {
            return a % b;
        }
    }
}
// ====
// compileViaYul: also
// ----
// div(uint256,uint256): 7, 2 -> 3
// gas Legacy: 22122
// gas LegacyOptimized: 21687
// gas Yul: 22591
// gas YulOptimized: 21774
// div(uint256,uint256): 7, 0 -> FAILURE, hex"4e487b71", 0x12 # throws #
// gas Legacy: 21925
// gas LegacyOptimized: 21600
// gas Yul: 22157
// gas YulOptimized: 21565
// mod(uint256,uint256): 7, 2 -> 1
// gas Legacy: 22144
// gas LegacyOptimized: 21709
// gas Yul: 22613
// gas YulOptimized: 21872
// mod(uint256,uint256): 7, 0 -> FAILURE, hex"4e487b71", 0x12 # throws #
// gas Legacy: 21947
// gas LegacyOptimized: 21622
// gas Yul: 22179
// gas YulOptimized: 21656
