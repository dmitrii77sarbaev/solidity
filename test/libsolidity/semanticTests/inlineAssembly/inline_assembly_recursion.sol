contract C {
    function f(uint256 a) public returns (uint256 b) {
        assembly {
            function fac(n) -> nf {
                switch n
                    case 0 {
                        nf := 1
                    }
                    case 1 {
                        nf := 1
                    }
                    default {
                        nf := mul(n, fac(sub(n, 1)))
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
// gas Legacy: 21867
// gas LegacyOptimized: 21577
// gas Yul: 22155
// gas YulOptimized: 21446
// f(uint256): 1 -> 1
// gas Legacy: 21890
// gas LegacyOptimized: 21600
// gas Yul: 22178
// gas YulOptimized: 21469
// f(uint256): 2 -> 2
// gas Legacy: 22008
// gas LegacyOptimized: 21715
// gas Yul: 22297
// gas YulOptimized: 21591
// f(uint256): 3 -> 6
// gas Legacy: 22126
// gas LegacyOptimized: 21830
// gas Yul: 22416
// gas YulOptimized: 21713
// f(uint256): 4 -> 24
// gas Legacy: 22244
// gas LegacyOptimized: 21945
// gas Yul: 22535
// gas YulOptimized: 21835
