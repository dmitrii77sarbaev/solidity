contract C {
    uint256[] x;
    function f() public returns(uint256) {
        x.push(42); x.push(42); x.push(42); x.push(42);
        uint256[] memory y = new uint256[](1);
        y[0] = 23;
        x = y;
        assembly { sstore(x.slot, 4) }
        assert(x[1] == 0);
        assert(x[2] == 0);
        return x[3];
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0
// gas Legacy: 138913
// gas LegacyOptimized: 137481
// gas Yul: 156549
// gas YulOptimized: 150551
