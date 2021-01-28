contract C {
    function exp_2(uint y) public returns (uint) {
        return 2**y;
    }
    function exp_minus_2(uint y) public returns (int) {
        return (-2)**y;
    }

    function exp_uint_max(uint y) public returns (uint) {
        return (2**256 - 1)**y;
    }
    function exp_int_max(uint y) public returns (int) {
        return ((-2)**255)**y;
    }

    function exp_5(uint y) public returns (uint) {
        return 5**y;
    }
    function exp_minus_5(uint y) public returns (int) {
        return (-5)**y;
    }

    function exp_256(uint y) public returns (uint) {
        return 256**y;
    }
    function exp_minus_256(uint y) public returns (int) {
        return (-256)**y;
    }

}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// exp_2(uint256): 255 -> 57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 22293
// gas LegacyOptimized: 21829
// gas Yul: 22335
// gas YulOptimized: 21742
// exp_minus_2(uint256): 255 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 23677
// gas LegacyOptimized: 22903
// gas Yul: 22404
// gas YulOptimized: 21868
// exp_uint_max(uint256): 1 -> 115792089237316195423570985008687907853269984665640564039457584007913129639935
// gas Legacy: 22393
// gas LegacyOptimized: 21966
// gas Yul: 22426
// gas YulOptimized: 21844
// exp_int_max(uint256): 1 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Legacy: 22104
// gas LegacyOptimized: 21727
// gas Yul: 22385
// gas YulOptimized: 21849
// exp_5(uint256): 110 -> 77037197775489434122239117703397092741524065928615527809597551822662353515625
// gas Legacy: 23411
// gas LegacyOptimized: 22679
// gas Yul: 22357
// gas YulOptimized: 21821
// exp_minus_5(uint256): 109 -> -15407439555097886824447823540679418548304813185723105561919510364532470703125
// gas Legacy: 23438
// gas LegacyOptimized: 22719
// gas Yul: 22294
// gas YulOptimized: 21758
// exp_256(uint256): 31 -> 452312848583266388373324160190187140051835877600158453279131187530910662656
// gas Legacy: 22273
// gas LegacyOptimized: 21863
// gas Yul: 22269
// gas YulOptimized: 21733
// exp_minus_256(uint256): 31 -> -452312848583266388373324160190187140051835877600158453279131187530910662656
// gas Legacy: 23120
// gas LegacyOptimized: 22499
// gas Yul: 22316
// gas YulOptimized: 21780
