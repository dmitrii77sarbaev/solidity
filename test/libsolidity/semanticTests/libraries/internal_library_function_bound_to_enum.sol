library L {
    enum E { A, B }

    function equals(E a, E b) internal pure returns (bool) {
        return a == b;
    }
}

contract C {
    using L for L.E;

    function equalsA(uint choice) public returns (bool) {
        L.E x = L.E.A;
        return x.equals(L.E(choice));
    }
}
// ====
// compileViaYul: also
// ----
// equalsA(uint256): 0 -> true
// gas Legacy: 21964
// gas LegacyOptimized: 21654
// gas Yul: 22573
// gas YulOptimized: 21576
// equalsA(uint256): 1 -> false
// gas Legacy: 21976
// gas LegacyOptimized: 21666
// gas Yul: 22585
// gas YulOptimized: 21588
