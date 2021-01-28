contract C {
    function f(bool a) public pure returns (bool x) {
        bool b = a;
        x = b;
        assert(b);
    }
    function f2(bool a) public pure returns (bool x) {
        bool b = a;
        x = b;
        require(b);
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
// gas YulOptimized: 21666
// f(bool): false -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 21633
// gas LegacyOptimized: 21468
// gas Yul: 21740
// gas YulOptimized: 21472
// f2(bool): true -> true
// gas Legacy: 21848
// gas LegacyOptimized: 21576
// gas Yul: 22171
// gas YulOptimized: 21718
// f2(bool): false -> FAILURE
// gas Legacy: 21637
// gas LegacyOptimized: 21466
// gas Yul: 21723
// gas YulOptimized: 21488
