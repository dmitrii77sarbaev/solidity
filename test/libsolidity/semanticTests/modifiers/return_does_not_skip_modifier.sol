contract C {
    uint256 public x;
    modifier setsx {
        _;
        x = 9;
    }

    function f() public setsx returns (uint256) {
        return 2;
    }
}

// ====
// compileViaYul: also
// ----
// x() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
// f() -> 2
// gas Legacy: 41415
// gas LegacyOptimized: 41298
// gas Yul: 43180
// gas YulOptimized: 41472
// x() -> 9
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
