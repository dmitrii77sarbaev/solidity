contract C {
    function f() public {
        assembly {
            invalid()
        }
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE
// gas Legacy: 100000000
// gas LegacyOptimized: 100000000
// gas Yul: 100000000
// gas YulOptimized: 100000000
