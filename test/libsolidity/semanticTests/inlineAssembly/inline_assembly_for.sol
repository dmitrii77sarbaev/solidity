contract C {
    function f(uint256 a) public returns (uint256 b) {
        assembly {
            function fac(n) -> nf {
                nf := 1
                for {
                    let i := n
                } gt(i, 0) {
                    i := sub(i, 1)
                } {
                    nf := mul(nf, i)
                }
            }
            b := fac(a)
        }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 0 -> 1
// gas Legacy: 21859
// gas LegacyOptimized: 21558
// gas Yul: 22147
// gas YulOptimized: 21399
// f(uint256): 1 -> 1
// gas Legacy: 21938
// gas LegacyOptimized: 21624
// gas Yul: 22227
// gas YulOptimized: 21476
// f(uint256): 2 -> 2
// gas Legacy: 22005
// gas LegacyOptimized: 21678
// gas Yul: 22295
// gas YulOptimized: 21541
// f(uint256): 3 -> 6
// gas Legacy: 22072
// gas LegacyOptimized: 21732
// gas Yul: 22363
// gas YulOptimized: 21606
// f(uint256): 4 -> 24
// gas Legacy: 22139
// gas LegacyOptimized: 21786
// gas Yul: 22431
// gas YulOptimized: 21671
