// This caused a failure since the type was not converted to its mobile type.
contract C {
    function f() public returns (uint256) {
        return [4][0];
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 4
// gas Legacy: 21466
// gas LegacyOptimized: 21312
// gas Yul: 22734
// gas YulOptimized: 21475
