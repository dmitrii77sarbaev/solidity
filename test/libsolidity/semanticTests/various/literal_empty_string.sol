contract C {
    bytes32 public x;
    uint256 public a;

    function f(bytes32 _x, uint256 _a) public {
        x = _x;
        a = _a;
    }

    function g() public {
        this.f("", 2);
    }
}

// ====
// compileViaYul: also
// ----
// x() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22275
// a() -> 0
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22297
// g() ->
// gas Legacy: 44464
// gas LegacyOptimized: 43943
// gas Yul: 47919
// gas YulOptimized: 44481
// x() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22275
// a() -> 2
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22297
