library L {
    function x() internal returns (uint256) {
        return 7;
    }
}


contract C {
    function() returns (uint256) internal x;

    constructor() {
        x = L.x;
    }

    function t() public returns (uint256) {
        return x();
    }
}

// ====
// compileViaYul: also
// ----
// t() -> 7
// gas Legacy: 22270
// gas LegacyOptimized: 22131
// gas Yul: 22989
// gas YulOptimized: 22258
