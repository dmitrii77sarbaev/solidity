contract C {
    modifier m(bool condition) {
        if (condition) _;
    }

    function f(uint x) public m(x >= 10) returns (uint[5] memory r) {
        r[2] = 3;
    }
}

// ====
// compileViaYul: also
// ----
// f(uint256): 9 -> 0x00, 0x00, 0x00, 0x00, 0x00
// gas Legacy: 23408
// gas LegacyOptimized: 22109
// gas Yul: 24314
// gas YulOptimized: 22450
// f(uint256): 10 -> 0x00, 0x00, 3, 0x00, 0x00
// gas Legacy: 23464
// gas LegacyOptimized: 22124
// gas Yul: 24771
// gas YulOptimized: 22473
