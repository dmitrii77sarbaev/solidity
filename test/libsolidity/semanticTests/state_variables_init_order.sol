contract A {
    uint public x = 0;
    uint y = f();
    function f() public returns (uint256) {
        ++x;
        return 42;
    }
}
contract B is A {
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// x() -> 1
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
