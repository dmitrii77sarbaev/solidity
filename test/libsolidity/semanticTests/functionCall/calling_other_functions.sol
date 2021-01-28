contract collatz {
    function run(uint x) public returns(uint y) {
        while ((y = x) > 1) {
            if (x % 2 == 0) x = evenStep(x);
            else x = oddStep(x);
        }
    }
    function evenStep(uint x) public returns(uint y) {
        return x / 2;
    }
    function oddStep(uint x) public returns(uint y) {
        return 3 * x + 1;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// run(uint256): 0 -> 0
// gas Legacy: 21821
// gas LegacyOptimized: 21534
// gas Yul: 22291
// gas YulOptimized: 21724
// run(uint256): 1 -> 1
// gas Legacy: 21833
// gas LegacyOptimized: 21546
// gas Yul: 22303
// gas YulOptimized: 21736
// run(uint256): 2 -> 1
// gas Legacy: 22328
// gas LegacyOptimized: 21782
// gas Yul: 23331
// gas YulOptimized: 21874
// run(uint256): 8 -> 1
// gas Legacy: 23318
// gas LegacyOptimized: 22254
// gas Yul: 25387
// gas YulOptimized: 22150
// run(uint256): 127 -> 1
// gas Legacy: 47798
// gas LegacyOptimized: 33782
// gas Yul: 74136
// gas YulOptimized: 29674
