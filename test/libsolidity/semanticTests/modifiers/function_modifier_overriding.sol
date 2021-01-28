contract A {
    function f() public mod returns (bool r) {
        return true;
    }

    modifier mod virtual {
        _;
    }
}


contract C is A {
    modifier mod override {
        if (false) _;
    }
}

// ====
// compileViaYul: also
// ----
// f() -> false
// gas Legacy: 21397
// gas LegacyOptimized: 21276
// gas Yul: 21830
// gas YulOptimized: 21229
