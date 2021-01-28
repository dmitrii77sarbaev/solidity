contract C {
    function f() public returns (bytes32 ret) {
        assembly {
            ret := extcodehash(0)
        }
    }
    function g() public returns (bytes32 ret) {
        assembly {
            ret := extcodehash(1)
        }
    }
    function h() public returns (bool ret) {
        assembly {
            ret := iszero(iszero(extcodehash(address())))
        }
    }
}

// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// f() -> 0
// gas Legacy: 22079
// gas LegacyOptimized: 21970
// gas Yul: 22461
// gas YulOptimized: 22140
// g() -> 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470
// gas Legacy: 22123
// gas LegacyOptimized: 22014
// gas Yul: 22505
// gas YulOptimized: 22184
// h() -> true
// gas Legacy: 22112
// gas LegacyOptimized: 22003
// gas Yul: 22494
// gas YulOptimized: 22173
