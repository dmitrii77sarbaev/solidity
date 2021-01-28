contract C {
    constructor() payable {}

    function f() public returns (uint256 ret) {
        assembly {
            ret := balance(0)
        }
    }
    function g() public returns (uint256 ret) {
        assembly {
            ret := balance(1)
        }
    }
    function h() public returns (uint256 ret) {
        assembly {
            ret := balance(address())
        }
    }
}

// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// constructor(), 23 wei ->
// gas Legacy: 121059
// gas LegacyOptimized: 101645
// gas Yul: 172463
// gas YulOptimized: 125972
// f() -> 0
// gas Legacy: 22079
// gas LegacyOptimized: 21970
// gas Yul: 22461
// gas YulOptimized: 22140
// g() -> 1
// gas Legacy: 22123
// gas LegacyOptimized: 22014
// gas Yul: 22505
// gas YulOptimized: 22184
// h() -> 23
// gas Legacy: 22100
// gas LegacyOptimized: 21991
// gas Yul: 22482
// gas YulOptimized: 21464
