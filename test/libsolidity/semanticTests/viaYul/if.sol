contract C {
    function f(bool condition) public returns (uint x) {
        x = 23;
        if (condition)
            x = 42;
    }
    function g(bool condition) public returns (uint x) {
        x = 0;
        if (condition)
            x = 42;
        else
            x = 23;
    }
    function h(bool condition) public returns (uint x) {
        if (condition)
            return 42;
        x = 23;
    }
    function i(bool condition) public returns (uint x) {
        if (condition)
            x = 10;
        else
            return 23;
        x = 42;
    }
    function j(uint a, uint b) public returns (uint x, uint y) {
        x = 42;
        if (a + b < 10)
            x = a;
        else
            x = b;
        y = 100;
    }
    function k(uint a, uint b) public returns (uint x, uint y) {
        x = 42;
        do {
            if (a + b < 10)
            {
                if (a == b)
                {
                    x = 99; y = 99;
                    break;
                }
                else
                {
                    x = a;
                }
            }
            else
            {
                x = b;
                if (a != b)
                    y = 17;
                else
                    y = 13;
                break;
            }
            y = 100;
        } while(false);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): 0 -> 23
// gas Legacy: 21864
// gas LegacyOptimized: 21600
// gas Yul: 22252
// gas YulOptimized: 21758
// f(bool): 1 -> 42
// gas Legacy: 21884
// gas LegacyOptimized: 21616
// gas Yul: 22360
// gas YulOptimized: 21778
// g(bool): 0 -> 23
// gas Legacy: 21909
// gas LegacyOptimized: 21650
// gas Yul: 22401
// gas YulOptimized: 21811
// g(bool): 1 -> 42
// gas Legacy: 21931
// gas LegacyOptimized: 21672
// gas Yul: 22423
// gas YulOptimized: 21833
// h(bool): 0 -> 23
// gas Legacy: 21799
// gas LegacyOptimized: 21540
// gas Yul: 22186
// gas YulOptimized: 21692
// h(bool): 1 -> 42
// gas Legacy: 21821
// gas LegacyOptimized: 21562
// gas Yul: 22208
// gas YulOptimized: 21714
// i(bool): 0 -> 23
// gas Legacy: 21832
// gas LegacyOptimized: 21573
// gas Yul: 22227
// gas YulOptimized: 21727
// i(bool): 1 -> 42
// gas Legacy: 21852
// gas LegacyOptimized: 21589
// gas Yul: 22335
// gas YulOptimized: 21729
// j(uint256,uint256): 1, 3 -> 1, 100
// gas Legacy: 22494
// gas LegacyOptimized: 21842
// gas Yul: 23135
// gas YulOptimized: 22035
// j(uint256,uint256): 3, 1 -> 3, 100
// gas Legacy: 22494
// gas LegacyOptimized: 21842
// gas Yul: 23135
// gas YulOptimized: 22035
// j(uint256,uint256): 10, 23 -> 23, 100
// gas Legacy: 22484
// gas LegacyOptimized: 21832
// gas Yul: 23125
// gas YulOptimized: 22025
// j(uint256,uint256): 23, 10 -> 10, 100
// gas Legacy: 22484
// gas LegacyOptimized: 21832
// gas Yul: 23125
// gas YulOptimized: 22025
// k(uint256,uint256): 1, 3 -> 1, 100
// gas Legacy: 22582
// gas LegacyOptimized: 21913
// gas Yul: 23446
// gas YulOptimized: 22196
// k(uint256,uint256): 3, 1 -> 3, 100
// gas Legacy: 22582
// gas LegacyOptimized: 21913
// gas Yul: 23446
// gas YulOptimized: 22196
// k(uint256,uint256): 3, 3 -> 99, 99
// gas Legacy: 22564
// gas LegacyOptimized: 21911
// gas Yul: 23356
// gas YulOptimized: 22161
// k(uint256,uint256): 10, 23 -> 23, 17
// gas Legacy: 22574
// gas LegacyOptimized: 21921
// gas Yul: 23372
// gas YulOptimized: 22177
// k(uint256,uint256): 23, 10 -> 10, 17
// gas Legacy: 22574
// gas LegacyOptimized: 21921
// gas Yul: 23372
// gas YulOptimized: 22177
// k(uint256,uint256): 23, 23 -> 23, 13
// gas Legacy: 22564
// gas LegacyOptimized: 21911
// gas Yul: 23362
// gas YulOptimized: 22167
