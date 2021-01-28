contract test {
    function f(uint x) public returns(uint d) {
        return x > 100 ?
                    x > 1000 ? 1000 : 100
                    :
                    x > 50 ? 50 : 10;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 1001 -> 1000
// gas Legacy: 21850
// gas LegacyOptimized: 21562
// gas Yul: 22673
// gas YulOptimized: 21692
// f(uint256): 500 -> 100
// gas Legacy: 21860
// gas LegacyOptimized: 21572
// gas Yul: 22663
// gas YulOptimized: 21682
// f(uint256): 80 -> 50
// gas Legacy: 21854
// gas LegacyOptimized: 21567
// gas Yul: 22745
// gas YulOptimized: 21671
// f(uint256): 40 -> 10
// gas Legacy: 21864
// gas LegacyOptimized: 21577
// gas Yul: 22735
// gas YulOptimized: 21661
