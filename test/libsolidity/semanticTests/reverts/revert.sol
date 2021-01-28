contract C {
    uint256 public a = 42;

    function f() public {
        a = 1;
        revert();
    }

    function g() public {
        a = 1;
        assembly {
            revert(0, 0)
        }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE
// gas Legacy: 22019
// gas LegacyOptimized: 22014
// gas Yul: 23321
// gas YulOptimized: 22081
// a() -> 42
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// g() -> FAILURE
// gas Legacy: 22041
// gas LegacyOptimized: 22036
// gas Yul: 23343
// gas YulOptimized: 22103
// a() -> 42
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
