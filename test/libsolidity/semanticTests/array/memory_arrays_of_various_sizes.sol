// Computes binomial coefficients the chinese way
contract C {
    function f(uint256 n, uint256 k) public returns (uint256) {
        uint256[][] memory rows = new uint256[][](n + 1);
        for (uint256 i = 1; i <= n; i++) {
            rows[i] = new uint256[](i);
            rows[i][0] = rows[i][rows[i].length - 1] = 1;
            for (uint256 j = 1; j < i - 1; j++)
                rows[i][j] = rows[i - 1][j - 1] + rows[i - 1][j];
        }
        return rows[n][k - 1];
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256,uint256): 3, 1 -> 1
// gas Legacy: 27650
// gas LegacyOptimized: 25331
// gas Yul: 28519
// gas YulOptimized: 28519
// f(uint256,uint256): 9, 5 -> 70
// gas Legacy: 73418
// gas LegacyOptimized: 51206
// gas Yul: 70507
// gas YulOptimized: 70507
