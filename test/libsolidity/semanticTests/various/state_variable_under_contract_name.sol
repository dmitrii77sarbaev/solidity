contract Scope {
    uint256 stateVar = 42;

    function getStateVar() public view returns (uint256 stateVar) {
        stateVar = Scope.stateVar;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// getStateVar() -> 42
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22742
// gas YulOptimized: 22034
