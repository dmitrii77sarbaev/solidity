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
// compileViaYul: true
// ----
// exp_2(uint256): 255 -> 57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Yul: 22335
// gas YulOptimized: 21742
// exp_2(uint256): 256 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21862
// gas YulOptimized: 21549
// exp_minus_2(uint256): 255 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Yul: 22404
// gas YulOptimized: 21868
// exp_minus_2(uint256): 256 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21928
// gas YulOptimized: 21615
// exp_uint_max(uint256): 1 -> 115792089237316195423570985008687907853269984665640564039457584007913129639935
// gas Yul: 22426
// gas YulOptimized: 21844
// exp_uint_max(uint256): 2 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21950
// gas YulOptimized: 21637
// exp_int_max(uint256): 1 -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
// gas Yul: 22385
// gas YulOptimized: 21849
// exp_int_max(uint256): 2 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21906
// gas YulOptimized: 21593
// exp_5(uint256): 110 -> 77037197775489434122239117703397092741524065928615527809597551822662353515625
// gas Yul: 22357
// gas YulOptimized: 21821
// exp_5(uint256): 111 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21884
// gas YulOptimized: 21571
// exp_minus_5(uint256): 109 -> -15407439555097886824447823540679418548304813185723105561919510364532470703125
// gas Yul: 22294
// gas YulOptimized: 21758
// exp_minus_5(uint256): 110 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21818
// gas YulOptimized: 21505
// exp_256(uint256): 31 -> 452312848583266388373324160190187140051835877600158453279131187530910662656
// gas Yul: 22269
// gas YulOptimized: 21733
// exp_256(uint256): 32 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21796
// gas YulOptimized: 21483
// exp_minus_256(uint256): 31 -> -452312848583266388373324160190187140051835877600158453279131187530910662656
// gas Yul: 22316
// gas YulOptimized: 21780
// exp_minus_256(uint256): 32 -> FAILURE, hex"4e487b71", 0x11
// gas Yul: 21840
// gas YulOptimized: 21527
