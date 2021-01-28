pragma abicoder               v2;

contract C {
    function g(address x) external pure returns (uint256 r) {
        assembly { r := x }
    }
    function f(uint256 a) external view returns (uint256) {
        address x;
        assembly { x := a }
        return this.g(x);
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256): 0 -> 0
// gas Legacy: 24458
// gas LegacyOptimized: 23572
// gas Yul: 25472
// gas YulOptimized: 23822
// g(address): 0 -> 0 # test validation as well as sanity check #
// gas Legacy: 21843
// gas LegacyOptimized: 21540
// gas Yul: 22156
// gas YulOptimized: 21694
// f(uint256): 1 -> 1
// gas Legacy: 24470
// gas LegacyOptimized: 23584
// gas Yul: 25484
// gas YulOptimized: 23834
// g(address): 1 -> 1
// gas Legacy: 21855
// gas LegacyOptimized: 21552
// gas Yul: 22168
// gas YulOptimized: 21706
// f(uint256): 2 -> 2
// gas Legacy: 24470
// gas LegacyOptimized: 23584
// gas Yul: 25484
// gas YulOptimized: 23834
// g(address): 2 -> 2
// gas Legacy: 21855
// gas LegacyOptimized: 21552
// gas Yul: 22168
// gas YulOptimized: 21706
// f(uint256): 0xabcdef0123456789abcdef0123456789abcdefff -> 0xabcdef0123456789abcdef0123456789abcdefff
// gas Legacy: 24698
// gas LegacyOptimized: 23812
// gas Yul: 25712
// gas YulOptimized: 24062
// g(address): 0xabcdef0123456789abcdef0123456789abcdefff -> 0xabcdef0123456789abcdef0123456789abcdefff
// gas Legacy: 22083
// gas LegacyOptimized: 21780
// gas Yul: 22396
// gas YulOptimized: 21934
// f(uint256): 0xffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 24698
// gas LegacyOptimized: 23812
// gas Yul: 25712
// gas YulOptimized: 24062
// g(address): 0xffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22083
// gas LegacyOptimized: 21780
// gas Yul: 22396
// gas YulOptimized: 21934
// f(uint256): 0x010000000000000000000000000000000000000000 -> 0
// gas Legacy: 24470
// gas LegacyOptimized: 23584
// gas Yul: 25484
// gas YulOptimized: 23834
// g(address): 0x010000000000000000000000000000000000000000 -> FAILURE
// gas Legacy: 21585
// gas LegacyOptimized: 21434
// gas Yul: 21626
// gas YulOptimized: 21441
// f(uint256): 0x01abcdef0123456789abcdef0123456789abcdefff -> 0xabcdef0123456789abcdef0123456789abcdefff
// gas Legacy: 24710
// gas LegacyOptimized: 23824
// gas Yul: 25724
// gas YulOptimized: 24074
// g(address): 0x01abcdef0123456789abcdef0123456789abcdefff -> FAILURE
// gas Legacy: 21825
// gas LegacyOptimized: 21674
// gas Yul: 21866
// gas YulOptimized: 21681
// f(uint256): 0x01ffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 24710
// gas LegacyOptimized: 23824
// gas Yul: 25724
// gas YulOptimized: 24074
// g(address): 0x01ffffffffffffffffffffffffffffffffffffffff -> FAILURE
// gas Legacy: 21825
// gas LegacyOptimized: 21674
// gas Yul: 21866
// gas YulOptimized: 21681
// f(uint256): -1 -> 0xffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 24842
// gas LegacyOptimized: 23956
// gas Yul: 25856
// gas YulOptimized: 24206
// g(address): -1 -> FAILURE
// gas Legacy: 21957
// gas LegacyOptimized: 21806
// gas Yul: 21998
// gas YulOptimized: 21813
