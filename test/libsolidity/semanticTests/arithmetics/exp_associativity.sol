contract C {
    // (2**3)**4 = 4096
    // 2**(3**4) = 2417851639229258349412352
    function test_hardcode1(uint a, uint b, uint c) public returns (uint256) {
        return a**b**c;
    }

    // (3**2)**2)**2 = 6561
    // 3**(2**(2**2) = 43046721
    function test_hardcode2(uint a, uint b, uint c, uint d) public returns (uint256) {
        return a**b**c**d;
    }

    function test_invariant(uint a, uint b, uint c) public returns (bool) {
        return a**b**c == a**(b**c);
    }

    function test_literal_mix(uint a, uint b) public returns (bool) {
        return
            (a**2**b == a**(2**b)) &&
            (2**a**b == 2**(a**b)) &&
            (a**b**2 == a**(b**2));
    }

    function test_other_operators(uint a, uint b) public returns (bool) {
        return
            (a**b/25 == (a**b)/25) &&
            (a**b*3**b == (a**b)*(3**b)) &&
            (b**a**a/b**a**b == (b**(a**a))/(b**(a**b)));
     }
}

// ====
// compileViaYul: also
// ----
// test_hardcode1(uint256,uint256,uint256): 2, 3, 4 -> 2417851639229258349412352
// gas Legacy: 23315
// gas LegacyOptimized: 22462
// gas Yul: 23656
// gas YulOptimized: 22553
// test_hardcode2(uint256,uint256,uint256,uint256): 3, 2, 2, 2 -> 43046721
// gas Legacy: 24095
// gas LegacyOptimized: 22920
// gas Yul: 24455
// gas YulOptimized: 23036
// test_invariant(uint256,uint256,uint256): 2, 3, 4 -> true
// gas Legacy: 24279
// gas LegacyOptimized: 23153
// gas Yul: 24737
// gas YulOptimized: 23184
// test_invariant(uint256,uint256,uint256): 3, 4, 2 -> true
// gas Legacy: 24371
// gas LegacyOptimized: 23353
// gas Yul: 24829
// gas YulOptimized: 23390
// test_literal_mix(uint256,uint256): 2, 3 -> true
// gas Legacy: 27359
// gas LegacyOptimized: 25048
// gas Yul: 27308
// gas YulOptimized: 24244
// test_other_operators(uint256,uint256): 2, 4 -> true
// gas Legacy: 29471
// gas LegacyOptimized: 26360
// gas Yul: 29876
// gas YulOptimized: 25658
