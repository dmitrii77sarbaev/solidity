contract C {
    function a() public returns (uint256) {
        return 7;
    }

    function() returns (uint256) internal y;

    function set() public returns (uint256) {
        y = a;
        return y();
    }

    function d() public returns (uint256) {
        delete y;
        return 1;
    }

    function ca() public returns (uint256) {
        return y();
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// set() -> 7
// gas Legacy: 43203
// gas LegacyOptimized: 42218
// gas Yul: 44126
// gas YulOptimized: 42447
// ca() -> 7
// gas Legacy: 22292
// gas LegacyOptimized: 22153
// gas Yul: 23012
// gas YulOptimized: 22341
// d() -> 1
// gas Legacy: 23065
// gas LegacyOptimized: 22932
// gas Yul: 23917
// gas YulOptimized: 23135
// ca() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 22097
// gas LegacyOptimized: 22073
// gas Yul: 22436
// gas YulOptimized: 22136
