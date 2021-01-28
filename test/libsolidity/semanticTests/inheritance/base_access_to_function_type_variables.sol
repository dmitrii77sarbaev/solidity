contract C {
    function() returns (uint256) internal x;

    function set() public {
        C.x = g;
    }

    function g() public pure returns (uint256) {
        return 2;
    }

    function h() public returns (uint256) {
        return C.x();
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 2
// gas Legacy: 21423
// gas LegacyOptimized: 21314
// gas Yul: 21893
// gas YulOptimized: 21481
// h() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 22075
// gas LegacyOptimized: 22051
// gas Yul: 22414
// gas YulOptimized: 22114
// set() ->
// gas Legacy: 42075
// gas LegacyOptimized: 42032
// gas Yul: 42734
// gas YulOptimized: 42226
// h() -> 2
// gas Legacy: 22270
// gas LegacyOptimized: 22131
// gas Yul: 22990
// gas YulOptimized: 22319
