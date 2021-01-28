library L {
    function f(uint256 a, uint256 b) external {
        assert(a * a == b);
    }
}
contract C {
    function addr() public view returns (bool) {
        return address(L) == address(0);
    }
    function g(uint256 a, uint256 b) public returns (bool) {
        (bool success,) = address(L).delegatecall(abi.encodeWithSignature("f(uint256,uint256)", a, b));
        return success;
    }
}
// ====
// compileViaYul: also
// ----
// library: L// g(uint256,uint256): 1, 1 -> true
// gas Legacy: 24641
// gas LegacyOptimized: 23363
// gas Yul: 25093
// gas YulOptimized: 23094
// g(uint256,uint256): 1, 2 -> false
// gas Legacy: 24727
// gas LegacyOptimized: 23455
// gas Yul: 25245
// gas YulOptimized: 23213
// g(uint256,uint256): 2, 3 -> false
// gas Legacy: 24727
// gas LegacyOptimized: 23455
// gas Yul: 25245
// gas YulOptimized: 23213
// g(uint256,uint256): 2, 4 -> true
// gas Legacy: 24641
// gas LegacyOptimized: 23363
// gas Yul: 25093
// gas YulOptimized: 23094
// g(uint256,uint256): 2, 5 -> false
// gas Legacy: 24727
// gas LegacyOptimized: 23455
// gas Yul: 25245
// gas YulOptimized: 23213
// g(uint256,uint256): 4, 15 -> false
// gas Legacy: 24727
// gas LegacyOptimized: 23455
// gas Yul: 25245
// gas YulOptimized: 23213
// g(uint256,uint256): 4, 16 -> true
// gas Legacy: 24641
// gas LegacyOptimized: 23363
// gas Yul: 25093
// gas YulOptimized: 23094
// g(uint256,uint256): 4, 17 -> false
// gas Legacy: 24727
// gas LegacyOptimized: 23455
// gas Yul: 25245
// gas YulOptimized: 23213
