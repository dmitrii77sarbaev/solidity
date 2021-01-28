contract C {
    uint[] storageArray;
    function popEmpty() public {
        storageArray.pop();
    }
}
// ====
// EVMVersion: >=petersburg
// compileViaYul: also
// ----
// popEmpty() -> FAILURE, hex"4e487b71", 0x31
// gas Legacy: 22023
// gas LegacyOptimized: 22029
// gas Yul: 22219
// gas YulOptimized: 22054
