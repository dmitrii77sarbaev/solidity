contract C {
    uint256 public a;
    modifier mod(uint256 x) {
        uint256 b = x;
        a += b;
        _;
        a -= b;
        assert(b == x);
    }

    function f(uint256 x) public mod(2) mod(5) mod(x) returns (uint256) {
        return a;
    }
}

// ====
// compileViaYul: also
// ----
// f(uint256): 3 -> 10
// gas Legacy: 52837
// gas LegacyOptimized: 51013
// gas Yul: 61752
// gas YulOptimized: 47715
// a() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
