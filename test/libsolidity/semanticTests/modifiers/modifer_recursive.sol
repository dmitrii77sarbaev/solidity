contract C {
    uint public called;
    modifier mod1 {
        called++;
        _;
    }
    function f(uint x) public mod1 returns (uint256 r) {
        return x == 0 ? 2 : f(x - 1)**2;
    }
}

// ====
// compileViaYul: also
// ----
// called() -> 0x00
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
// f(uint256): 5 -> 0x0100000000
// gas Legacy: 55454
// gas LegacyOptimized: 53440
// gas Yul: 66280
// gas YulOptimized: 53173
// called() -> 6
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
