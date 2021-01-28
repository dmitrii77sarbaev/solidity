contract C {
    function f(bool a) public pure returns (bool x) {
        bool b = a;
        x = b;
        assert(b);
    }
    function fail() public pure returns (bool x) {
        x = true;
        assert(false);
    }
    function succeed() public pure returns (bool x) {
        x = true;
        assert(true);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool): true -> true
// gas Legacy: 21826
// gas LegacyOptimized: 21554
// gas Yul: 22149
// gas YulOptimized: 21696
// f(bool): false -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 21633
// gas LegacyOptimized: 21468
// gas Yul: 21740
// gas YulOptimized: 21490
// fail() -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 21250
// gas LegacyOptimized: 21232
// gas Yul: 21450
// gas YulOptimized: 21310
// succeed() -> true
// gas Legacy: 21446
// gas LegacyOptimized: 21332
// gas Yul: 21864
// gas YulOptimized: 21487
