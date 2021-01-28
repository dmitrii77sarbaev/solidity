contract C {
    function g(bool x) public pure {
        assert(x);
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
// gas YulOptimized: 23736
// f(bool): false -> 2
// gas Legacy: 23938
// gas LegacyOptimized: 23429
// gas Yul: 24724
// gas YulOptimized: 23447
