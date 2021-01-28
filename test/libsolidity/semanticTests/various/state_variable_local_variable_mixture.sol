contract A {
    uint256 x = 1;
    uint256 y = 2;

    function a() public returns (uint256 x) {
        x = A.y;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// a() -> 2
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22742
// gas YulOptimized: 22034
