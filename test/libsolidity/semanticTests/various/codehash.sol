contract C {
    function f() public returns (bytes32) {
        // non-existent in tests
        return address(0).codehash;
    }
    function g() public returns (bytes32) {
        // precompile
        return address(0x1).codehash;
    }
    function h() public returns (bool) {
        return address(this).codehash != 0;
    }
}

// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// f() -> 0x0
// gas Legacy: 22085
// gas LegacyOptimized: 21970
// gas Yul: 22611
// gas YulOptimized: 22140
// g() -> 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470
// gas Legacy: 22129
// gas LegacyOptimized: 22014
// gas Yul: 22655
// gas YulOptimized: 22184
// h() -> true
// gas Legacy: 22127
// gas LegacyOptimized: 22003
// gas Yul: 22834
// gas YulOptimized: 22173
