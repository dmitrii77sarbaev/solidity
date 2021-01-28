contract C {
    modifier m {
        uint256 a = 1;
        assembly {
            a := 2
        }
        if (a != 2) revert();
        _;
    }

    function f() public m returns (bool) {
        return true;
    }

    modifier n {
        uint256 a = 1;
        assembly {
            a := 2
        }
        if (a != 2)
            _;
        revert();
    }

    function g() public n returns (bool) {
        // This statement should never execute.
        return true;
    }
}

// ====
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 21429
// gas LegacyOptimized: 21276
// gas Yul: 22133
// gas YulOptimized: 21344
// g() -> FAILURE
// gas Legacy: 21250
// gas LegacyOptimized: 21223
// gas Yul: 21652
// gas YulOptimized: 21257
