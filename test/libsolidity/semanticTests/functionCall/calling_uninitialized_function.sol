contract C {
    function intern() public returns (uint256) {
        function (uint) internal returns (uint) x;
        x(2);
        return 7;
    }

    function extern() public returns (uint256) {
        function (uint) external returns (uint) x;
        x(2);
        return 7;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// intern() -> FAILURE, hex"4e487b71", 0x51 # This should throw exceptions #
// gas Legacy: 21231
// gas LegacyOptimized: 21237
// gas Yul: 21544
// gas YulOptimized: 21230
// extern() -> FAILURE
// gas Legacy: 22209
// gas LegacyOptimized: 22065
// gas Yul: 22160
// gas YulOptimized: 22000
