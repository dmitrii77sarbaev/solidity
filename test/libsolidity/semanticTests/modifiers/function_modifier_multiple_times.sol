contract C {
    uint256 public a;
    modifier mod(uint256 x) {
        a += x;
        _;
    }

    function f(uint256 x) public mod(2) mod(5) mod(x) returns (uint256) {
        return a;
    }
}

// ====
// compileViaYul: also
// ----
// f(uint256): 3 -> 10
// gas Legacy: 47284
// gas LegacyOptimized: 46629
// gas Yul: 52010
// gas YulOptimized: 44308
// a() -> 10
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
