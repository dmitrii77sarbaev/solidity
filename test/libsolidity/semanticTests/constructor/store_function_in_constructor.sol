contract C {
    uint256 public result_in_constructor;
    function(uint256) returns (uint256) internal x;

    constructor() {
        x = double;
        result_in_constructor = use(2);
    }

    function double(uint256 _arg) public returns (uint256 _ret) {
        _ret = _arg * 2;
    }

    function use(uint256 _arg) public returns (uint256) {
        return x(_arg);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// use(uint256): 3 -> 6
// gas Legacy: 22918
// gas LegacyOptimized: 22480
// gas Yul: 23558
// gas YulOptimized: 22622
// result_in_constructor() -> 4
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
