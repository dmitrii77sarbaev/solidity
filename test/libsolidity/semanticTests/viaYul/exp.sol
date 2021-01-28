contract C {
    function f(uint x, uint y) public returns (uint) {
        return x**y;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256): 0, 0 -> 1
// gas Legacy: 22310
// gas LegacyOptimized: 21752
// gas Yul: 22625
// gas YulOptimized: 21677
// f(uint256,uint256): 0, 1 -> 0x00
// gas Legacy: 22339
// gas LegacyOptimized: 21781
// gas Yul: 22660
// gas YulOptimized: 21712
// f(uint256,uint256): 0, 2 -> 0x00
// gas Legacy: 22339
// gas LegacyOptimized: 21781
// gas Yul: 22660
// gas YulOptimized: 21712
// f(uint256,uint256): 1, 0 -> 1
// gas Legacy: 22322
// gas LegacyOptimized: 21764
// gas Yul: 22637
// gas YulOptimized: 21689
// f(uint256,uint256): 1, 1 -> 1
// gas Legacy: 22380
// gas LegacyOptimized: 21825
// gas Yul: 22701
// gas YulOptimized: 21753
// f(uint256,uint256): 1, 2 -> 1
// gas Legacy: 22380
// gas LegacyOptimized: 21825
// gas Yul: 22701
// gas YulOptimized: 21753
// f(uint256,uint256): 2, 0 -> 1
// gas Legacy: 22322
// gas LegacyOptimized: 21764
// gas Yul: 22637
// gas YulOptimized: 21689
// f(uint256,uint256): 2, 1 -> 2
// gas Legacy: 22517
// gas LegacyOptimized: 21905
// gas Yul: 22838
// gas YulOptimized: 21833
// f(uint256,uint256): 2, 2 -> 4
// gas Legacy: 22517
// gas LegacyOptimized: 21905
// gas Yul: 22838
// gas YulOptimized: 21833
// f(uint256,uint256): 7, 63 -> 174251498233690814305510551794710260107945042018748343
// gas Legacy: 22563
// gas LegacyOptimized: 22005
// gas Yul: 22884
// gas YulOptimized: 21936
// f(uint256,uint256): 128, 2 -> 0x4000
// gas Legacy: 22563
// gas LegacyOptimized: 22005
// gas Yul: 22884
// gas YulOptimized: 21936
