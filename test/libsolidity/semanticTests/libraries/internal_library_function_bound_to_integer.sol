library L {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

contract C {
    using L for uint256;

    function foo(uint256 a, uint256 b) public returns (uint256) {
        return a.add(b);
    }
}
// ====
// compileViaYul: also
// ----
// foo(uint256,uint256): 8, 42 -> 50
// gas Legacy: 22354
// gas LegacyOptimized: 21774
// gas Yul: 22693
// gas YulOptimized: 21731
