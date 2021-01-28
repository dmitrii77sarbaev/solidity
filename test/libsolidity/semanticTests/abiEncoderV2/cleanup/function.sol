pragma abicoder               v2;

contract C {
    struct S { function() external f; }
    function ggg(function() external x) external pure returns (uint256 r) {
        assembly { r := calldataload(4) }
    }
    function h(S calldata x) external pure returns (uint256 r) {
        x.f; // validation only happens here
        assembly { r := calldataload(4) }
    }
    function dummy() external {}
    function ffff(uint256 a) external view returns (uint256, uint256) {
        S memory s = S(this.dummy);
        assembly { mstore(s, a) }
        return (this.ggg(s.f), this.h(s));
    }
}
// ====
// compileViaYul: also
// ----
// ffff(uint256): 0 -> 0, 0
// gas Legacy: 28237
// gas LegacyOptimized: 25979
// gas Yul: 30257
// gas YulOptimized: 27004
// ggg(function): 0 -> 0
// gas Legacy: 22062
// gas LegacyOptimized: 21559
// gas Yul: 22376
// gas YulOptimized: 21800
// ffff(uint256): "01234567890123456789abcd" -> "01234567890123456789abcd", "01234567890123456789abcd"
// gas Legacy: 28525
// gas LegacyOptimized: 26267
// gas Yul: 30545
// gas YulOptimized: 27292
// ggg(function): "01234567890123456789abcd" -> "01234567890123456789abcd"
// gas Legacy: 22350
// gas LegacyOptimized: 21847
// gas Yul: 22664
// gas YulOptimized: 22088
// h((function)): "01234567890123456789abcd" -> "01234567890123456789abcd"
// gas Legacy: 22591
// gas LegacyOptimized: 21982
// gas Yul: 22731
// gas YulOptimized: 22070
// h((function)): 0 -> 0
// gas Legacy: 22303
// gas LegacyOptimized: 21694
// gas Yul: 22443
// gas YulOptimized: 21782
// ffff(uint256): "01234567890123456789abcdX" -> "01234567890123456789abcd", "01234567890123456789abcd"
// gas Legacy: 28537
// gas LegacyOptimized: 26279
// gas Yul: 30557
// gas YulOptimized: 27304
// ggg(function): "01234567890123456789abcdX" -> FAILURE
// gas Legacy: 21884
// gas LegacyOptimized: 21694
// gas Yul: 21913
// gas YulOptimized: 21722
// h((function)): "01234567890123456789abcdX" -> FAILURE
// gas Legacy: 22138
// gas LegacyOptimized: 21834
// gas Yul: 22096
// gas YulOptimized: 21806
