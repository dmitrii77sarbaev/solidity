contract test {
    function f(bool cond) public returns (uint, uint) {
        return cond ? (1, 2) : (3, 4);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> 1, 2
// gas Legacy: 21947
// gas LegacyOptimized: 21596
// gas Yul: 22711
// gas YulOptimized: 21686
// f(bool): false -> 3, 4
// gas Legacy: 21945
// gas LegacyOptimized: 21594
// gas Yul: 22689
// gas YulOptimized: 21664
