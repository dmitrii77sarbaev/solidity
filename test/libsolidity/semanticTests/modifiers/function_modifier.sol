contract C {
    function getOne() public payable nonFree returns (uint256 r) {
        return 1;
    }

    modifier nonFree {
        if (msg.value > 0) _;
    }
}

// ====
// compileViaYul: also
// ----
// getOne() -> 0
// gas Legacy: 21372
// gas LegacyOptimized: 21265
// gas Yul: 21942
// gas YulOptimized: 21237
// getOne(), 1 wei -> 1
// gas Legacy: 21380
// gas LegacyOptimized: 21270
// gas Yul: 22090
// gas YulOptimized: 21245
