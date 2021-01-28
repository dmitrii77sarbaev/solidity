contract C {
    function f() public {
        assert(false);
    }

    function g(bool val) public returns (bool) {
        assert(val == true);
        return true;
    }

    function h(bool val) public returns (bool) {
        require(val);
        return true;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 21239
// gas LegacyOptimized: 21229
// gas Yul: 21395
// gas YulOptimized: 21299
// g(bool): false -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 21676
// gas LegacyOptimized: 21521
// gas Yul: 21882
// gas YulOptimized: 21546
// g(bool): true -> true
// gas Legacy: 21875
// gas LegacyOptimized: 21610
// gas Yul: 22299
// gas YulOptimized: 21766
// h(bool): false -> FAILURE
// gas Legacy: 21596
// gas LegacyOptimized: 21441
// gas Yul: 21693
// gas YulOptimized: 21466
// h(bool): true -> true
// gas Legacy: 21813
// gas LegacyOptimized: 21554
// gas Yul: 22149
// gas YulOptimized: 21710
