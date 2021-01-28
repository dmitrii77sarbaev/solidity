contract C {
    function g(bool x) public pure {
        require(x);
    }
    function f(bool x) public returns (uint) {
        // Set the gas to make this work on pre-byzantium VMs
        try this.g{gas: 8000}(x) {
            return 1;
        } catch {
            return 2;
        }
    }
}
// ====
// compileViaYul: also
// ----
// f(bool): true -> 1
// gas Legacy: 23933
// gas LegacyOptimized: 23418
// gas Yul: 25221
// gas YulOptimized: 23695
// f(bool): false -> 2
// gas Legacy: 23920
// gas LegacyOptimized: 23405
// gas Yul: 24685
// gas YulOptimized: 23423
