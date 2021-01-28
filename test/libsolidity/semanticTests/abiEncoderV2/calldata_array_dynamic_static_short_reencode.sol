pragma abicoder               v2;
contract C {
    function f(uint256[][2][] calldata x) external returns (uint256) {
        return 42;
    }
    function g(uint256[][2][] calldata x) external returns (uint256) {
        return this.f(x);
    }
}
// ====
// compileViaYul: also
// ----
// g(uint256[][2][]): 0x20, 0x01, 0x20, 0x40, 0x60, 0x00, 0x00 -> 42
// gas Legacy: 27372
// gas LegacyOptimized: 25807
// gas Yul: 28479
// gas YulOptimized: 26107
// g(uint256[][2][]): 0x20, 0x01, 0x20, 0x00, 0x00 -> 42
// gas Legacy: 27092
// gas LegacyOptimized: 25527
// gas Yul: 28199
// gas YulOptimized: 25827
// g(uint256[][2][]): 0x20, 0x01, 0x20, 0x00 -> FAILURE
// gas Legacy: 22489
// gas LegacyOptimized: 22277
// gas Yul: 23526
// gas YulOptimized: 22942
