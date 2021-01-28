contract C {
    function f() public returns (uint256) {
        uint256[][] memory a = new uint256[][](0);
        return 7;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 7
// gas Legacy: 21490
// gas LegacyOptimized: 21344
// gas Yul: 22565
// gas YulOptimized: 21755
