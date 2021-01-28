contract Flow {
    bool public success;

    mapping(address => function() internal) stages;

    function stage0() internal {
        stages[msg.sender] = stage1;
    }

    function stage1() internal {
        stages[msg.sender] = stage2;
    }

    function stage2() internal {
        success = true;
    }

    constructor() {
        stages[msg.sender] = stage0;
    }

    function f() public returns (uint256) {
        stages[msg.sender]();
        return 7;
    }
}

// ====
// compileViaYul: also
// ----
// success() -> false
// gas Legacy: 22210
// gas LegacyOptimized: 22082
// gas Yul: 22734
// gas YulOptimized: 22220
// f() -> 7
// gas Legacy: 24129
// gas LegacyOptimized: 23904
// gas Yul: 25434
// gas YulOptimized: 24094
// f() -> 7
// gas Legacy: 24129
// gas LegacyOptimized: 23904
// gas Yul: 25456
// gas YulOptimized: 24116
// success() -> false
// gas Legacy: 22210
// gas LegacyOptimized: 22082
// gas Yul: 22734
// gas YulOptimized: 22220
// f() -> 7
// gas Legacy: 43240
// gas LegacyOptimized: 43036
// gas Yul: 44407
// gas YulOptimized: 43260
// success() -> true
// gas Legacy: 22210
// gas LegacyOptimized: 22082
// gas Yul: 22734
// gas YulOptimized: 22220
