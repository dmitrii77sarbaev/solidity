contract C {
    modifier mod1 {
        uint8 a = 1;
        uint8 b = 2;
        _;
    }
    modifier mod2(bool a) {
        if (a) return;
        else _;
    }

    function f(bool a) public mod1 mod2(a) returns (uint256 r) {
        return 3;
    }
}

// ====
// compileViaYul: also
// ----
// f(bool): true -> 0
// gas Legacy: 21844
// gas LegacyOptimized: 21572
// gas Yul: 22233
// gas YulOptimized: 21507
// f(bool): false -> 3
// gas Legacy: 21830
// gas LegacyOptimized: 21558
// gas Yul: 22365
// gas YulOptimized: 21494
