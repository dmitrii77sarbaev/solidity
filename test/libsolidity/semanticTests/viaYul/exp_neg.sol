contract C {
    function f(int x, uint y) public returns (int) {
        return x**y;
    }
}
// ====
// compileViaYul: also
// ----
// f(int256,uint256): 0, 0 -> 1
// gas Legacy: 22327
// gas LegacyOptimized: 21796
// gas Yul: 22651
// gas YulOptimized: 21703
// f(int256,uint256): 0, 1 -> 0x00
// gas Legacy: 22361
// gas LegacyOptimized: 21830
// gas Yul: 22685
// gas YulOptimized: 21737
// f(int256,uint256): 0, 2 -> 0x00
// gas Legacy: 22388
// gas LegacyOptimized: 21854
// gas Yul: 22718
// gas YulOptimized: 21770
// f(int256,uint256): 1, 0 -> 1
// gas Legacy: 22339
// gas LegacyOptimized: 21808
// gas Yul: 22663
// gas YulOptimized: 21715
// f(int256,uint256): 1, 1 -> 1
// gas Legacy: 22373
// gas LegacyOptimized: 21842
// gas Yul: 22697
// gas YulOptimized: 21749
// f(int256,uint256): 1, 2 -> 1
// gas Legacy: 22789
// gas LegacyOptimized: 22177
// gas Yul: 23121
// gas YulOptimized: 22145
// f(int256,uint256): 2, 0 -> 1
// gas Legacy: 22339
// gas LegacyOptimized: 21808
// gas Yul: 22663
// gas YulOptimized: 21715
// f(int256,uint256): 2, 1 -> 2
// gas Legacy: 22373
// gas LegacyOptimized: 21842
// gas Yul: 22697
// gas YulOptimized: 21749
// f(int256,uint256): 2, 2 -> 4
// gas Legacy: 22789
// gas LegacyOptimized: 22177
// gas Yul: 23121
// gas YulOptimized: 22145
// f(int256,uint256): 7, 63 -> 174251498233690814305510551794710260107945042018748343
// gas Legacy: 23541
// gas LegacyOptimized: 22722
// gas Yul: 23881
// gas YulOptimized: 22841
// f(int256,uint256): 128, 2 -> 0x4000
// gas Legacy: 22789
// gas LegacyOptimized: 22177
// gas Yul: 23121
// gas YulOptimized: 22145
// f(int256,uint256): -1, 0 -> 1
// gas Legacy: 22711
// gas LegacyOptimized: 22180
// gas Yul: 23035
// gas YulOptimized: 22087
// f(int256,uint256): -1, 1 -> -1
// gas Legacy: 22745
// gas LegacyOptimized: 22214
// gas Yul: 23069
// gas YulOptimized: 22121
// f(int256,uint256): -1, 2 -> 1
// gas Legacy: 23172
// gas LegacyOptimized: 22556
// gas Yul: 23504
// gas YulOptimized: 22528
// f(int256,uint256): -2, 0 -> 1
// gas Legacy: 22711
// gas LegacyOptimized: 22180
// gas Yul: 23035
// gas YulOptimized: 22087
// f(int256,uint256): -2, 1 -> -2
// gas Legacy: 22745
// gas LegacyOptimized: 22214
// gas Yul: 23069
// gas YulOptimized: 22121
// f(int256,uint256): -2, 2 -> 4
// gas Legacy: 23172
// gas LegacyOptimized: 22556
// gas Yul: 23504
// gas YulOptimized: 22528
// f(int256,uint256): -7, 63 -> -174251498233690814305510551794710260107945042018748343
// gas Legacy: 23924
// gas LegacyOptimized: 23101
// gas Yul: 24264
// gas YulOptimized: 23224
// f(int256,uint256): -128, 2 -> 0x4000
// gas Legacy: 23172
// gas LegacyOptimized: 22556
// gas Yul: 23504
// gas YulOptimized: 22528
// f(int256,uint256): -1, 115792089237316195423570985008687907853269984665640564039457584007913129639935 -> -1
// gas Legacy: 70796
// gas LegacyOptimized: 57223
// gas Yul: 71636
// gas YulOptimized: 66596
// f(int256,uint256): -2, 255 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 24296
// gas LegacyOptimized: 23371
// gas Yul: 24640
// gas YulOptimized: 23568
// f(int256,uint256): -8, 85 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 24062
// gas LegacyOptimized: 23194
// gas Yul: 24404
// gas YulOptimized: 23348
// f(int256,uint256): -131072, 15 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 23528
// gas LegacyOptimized: 22807
// gas Yul: 23864
// gas YulOptimized: 22856
// f(int256,uint256): -32, 51 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 23892
// gas LegacyOptimized: 23073
// gas Yul: 24232
// gas YulOptimized: 23192
// f(int256,uint256): -57896044618658097711785492504343953926634992332820282019728792003956564819968, 1 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 22373
// gas LegacyOptimized: 21842
// gas Yul: 22697
// gas YulOptimized: 21749
