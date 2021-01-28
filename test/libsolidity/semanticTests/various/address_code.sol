contract C {
    bytes public initCode;

    constructor() {
        // This should catch problems, but lets also test the case the optimiser is buggy.
        assert(address(this).code.length == 0);
        initCode = address(this).code;
    }

    // To avoid dependency on exact length.
    function f() public view returns (bool) { return address(this).code.length > 400; }
    function g() public view returns (uint) { return address(0).code.length; }
    function h() public view returns (uint) { return address(1).code.length; }
}
// ====
// compileViaYul: also
// ----
// constructor() ->
// gas Legacy: 262778
// gas LegacyOptimized: 187526
// gas Yul: 390761
// gas YulOptimized: 240202
// initCode() -> 0x20, 0
// gas Legacy: 23650
// gas LegacyOptimized: 23380
// gas Yul: 23523
// gas YulOptimized: 22872
// f() -> true
// gas Legacy: 22096
// gas LegacyOptimized: 21981
// gas Yul: 22759
// gas YulOptimized: 22186
// g() -> 0
// gas Legacy: 22151
// gas LegacyOptimized: 22036
// gas Yul: 22677
// gas YulOptimized: 22241
// h() -> 0
// gas Legacy: 22129
// gas LegacyOptimized: 22014
// gas Yul: 22655
// gas YulOptimized: 22219
