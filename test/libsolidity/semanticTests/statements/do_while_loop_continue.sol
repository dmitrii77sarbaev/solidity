contract test {
    function f() public pure returns(uint r) {
        uint i = 0;
        do
        {
            if (i > 0) return 0;
            i++;
            continue;
        } while (false);
        return 42;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 42
// gas Legacy: 21578
// gas LegacyOptimized: 21360
// gas Yul: 22393
// gas YulOptimized: 21456
