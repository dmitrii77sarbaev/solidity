contract C {
    function f(uint x) public returns (uint i) {
        assembly {
            for {} lt(i, 10) { i := add(i, 1) }
            {
                if eq(x, 0) { i := 2 break }
                for {} lt(x, 3) { i := 17 x := 9 } {
                    if eq(x, 1) { continue }
                    if eq(x, 2) { break }
                }
                if eq(x, 4) { i := 90 }
            }
        }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 0 -> 2
// gas Legacy: 21835
// gas LegacyOptimized: 21539
// gas Yul: 22134
// gas YulOptimized: 21617
// f(uint256): 1 -> 18
// gas Legacy: 22023
// gas LegacyOptimized: 21718
// gas Yul: 22323
// gas YulOptimized: 21806
// f(uint256): 2 -> 10
// gas Legacy: 23723
// gas LegacyOptimized: 23259
// gas Yul: 24032
// gas YulOptimized: 23488
// f(uint256): 4 -> 91
// gas Legacy: 21941
// gas LegacyOptimized: 21636
// gas Yul: 22241
// gas YulOptimized: 21724
