contract C {
    function() internal returns (uint)[] x;
    function() internal returns (uint)[] y;

    function test() public returns (uint256) {
        x = new function() internal returns (uint)[](10);
        x[9] = a;
        y = x;
        return y[9]();
    }

    function a() public returns (uint256) {
        return 7;
    }
}

// ====
// compileViaYul: also
// ----
// test() -> 7
// gas Legacy: 211296
// gas LegacyOptimized: 211120
// gas Yul: 143547
// gas YulOptimized: 134482
