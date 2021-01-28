contract C {
    uint256 x;

    function f() public returns (uint256) {
        x = 3;
        return 1;
    }
}


interface CView {
    function f() external view returns (uint256);
}


interface CPure {
    function f() external pure returns (uint256);
}


contract D {
    function f() public returns (uint256) {
        return (new C()).f();
    }

    function fview() public returns (uint256) {
        return (CView(address(new C()))).f();
    }

    function fpure() public returns (uint256) {
        return (CPure(address(new C()))).f();
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// f() -> 0x1 # This should work, next should throw #
// gas Legacy: 121980
// gas LegacyOptimized: 112388
// gas Yul: 186425
// gas YulOptimized: 92036
// fview() -> FAILURE
// gas Legacy: 98439119
// gas LegacyOptimized: 98438975
// gas Yul: 98440114
// gas YulOptimized: 98438674
// fpure() -> FAILURE
// gas Legacy: 98439119
// gas LegacyOptimized: 98438975
// gas Yul: 98440114
// gas YulOptimized: 98438674
