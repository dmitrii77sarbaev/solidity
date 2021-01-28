contract C {
    function f(uint256 a) public returns (uint256 b) {
        assembly {
            switch a
                case 1 {
                    b := 8
                }
                case 2 {
                    b := 9
                }
                default {
                    b := 2
                }
        }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 0 -> 2
// gas Legacy: 21833
// gas LegacyOptimized: 21549
// gas Yul: 22132
// gas YulOptimized: 21496
// f(uint256): 1 -> 8
// gas Legacy: 21824
// gas LegacyOptimized: 21540
// gas Yul: 22123
// gas YulOptimized: 21487
// f(uint256): 2 -> 9
// gas Legacy: 21835
// gas LegacyOptimized: 21551
// gas Yul: 22134
// gas YulOptimized: 21498
// f(uint256): 3 -> 2
// gas Legacy: 21845
// gas LegacyOptimized: 21561
// gas Yul: 22144
// gas YulOptimized: 21508
