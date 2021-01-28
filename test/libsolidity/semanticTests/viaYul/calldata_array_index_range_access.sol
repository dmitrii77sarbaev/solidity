pragma abicoder               v2;
contract C {
    function f(uint256[] calldata x, uint256 s, uint256 e) external returns (uint256) {
        return uint256[](x[s:e]).length;
    }
    function f(uint256[] calldata x, uint256 s, uint256 e, uint256 ss, uint256 ee) external returns (uint256) {
        return uint256[](x[s:e][ss:ee]).length;
    }
    function f_s_only(uint256[] calldata x, uint256 s) external returns (uint256) {
        return uint256[](x[s:]).length;
    }
    function f_e_only(uint256[] calldata x, uint256 e) external returns (uint256) {
        return uint256[](x[:e]).length;
    }
    function g(uint256[] calldata x, uint256 s, uint256 e, uint256 idx) external returns (uint256) {
        return uint256[](x[s:e])[idx];
    }
    function gg(uint256[] calldata x, uint256 s, uint256 e, uint256 idx) external returns (uint256) {
        return x[s:e][idx];
    }
    function gg_s_only(uint256[] calldata x, uint256 s, uint256 idx) external returns (uint256) {
        return x[s:][idx];
    }
    function gg_e_only(uint256[] calldata x, uint256 e, uint256 idx) external returns (uint256) {
        return x[:e][idx];
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256[],uint256,uint256): 0x60, 2, 4, 5, 1, 2, 3, 4, 5 -> 2
// gas Legacy: 23530
// gas LegacyOptimized: 23059
// gas Yul: 23934
// gas YulOptimized: 23189
// f(uint256[],uint256,uint256): 0x60, 2, 6, 5, 1, 2, 3, 4, 5 -> FAILURE
// gas Legacy: 23261
// gas LegacyOptimized: 22912
// gas Yul: 23316
// gas YulOptimized: 22913
// f(uint256[],uint256,uint256): 0x60, 3, 3, 5, 1, 2, 3, 4, 5 -> 0
// gas Legacy: 23530
// gas LegacyOptimized: 23059
// gas Yul: 23934
// gas YulOptimized: 23189
// f(uint256[],uint256,uint256): 0x60, 4, 3, 5, 1, 2, 3, 4, 5 -> FAILURE
// gas Legacy: 23235
// gas LegacyOptimized: 22886
// gas Yul: 23290
// gas YulOptimized: 22887
// f(uint256[],uint256,uint256): 0x60, 0, 3, 5, 1, 2, 3, 4, 5 -> 3
// gas Legacy: 23518
// gas LegacyOptimized: 23047
// gas Yul: 23922
// gas YulOptimized: 23177
// f(uint256[],uint256,uint256,uint256,uint256): 0xA0, 1, 3, 1, 2, 5, 1, 2, 3, 4, 5 -> 1
// gas Legacy: 24356
// gas LegacyOptimized: 23562
// gas Yul: 24767
// gas YulOptimized: 23789
// f(uint256[],uint256,uint256,uint256,uint256): 0xA0, 1, 3, 1, 4, 5, 1, 2, 3, 4, 5 -> FAILURE
// gas Legacy: 24083
// gas LegacyOptimized: 23411
// gas Yul: 24141
// gas YulOptimized: 23464
// f_s_only(uint256[],uint256): 0x40, 2, 5, 1, 2, 3, 4, 5 -> 3
// gas Legacy: 23236
// gas LegacyOptimized: 22928
// gas Yul: 23633
// gas YulOptimized: 23043
// f_s_only(uint256[],uint256): 0x40, 6, 5, 1, 2, 3, 4, 5 -> FAILURE
// gas Legacy: 22943
// gas LegacyOptimized: 22757
// gas Yul: 22991
// gas YulOptimized: 22743
// f_e_only(uint256[],uint256): 0x40, 3, 5, 1, 2, 3, 4, 5 -> 3
// gas Legacy: 23235
// gas LegacyOptimized: 22927
// gas Yul: 23721
// gas YulOptimized: 23131
// f_e_only(uint256[],uint256): 0x40, 6, 5, 1, 2, 3, 4, 5 -> FAILURE
// gas Legacy: 22968
// gas LegacyOptimized: 22782
// gas Yul: 23105
// gas YulOptimized: 22857
// g(uint256[],uint256,uint256,uint256): 0x80, 2, 4, 1, 5, 1, 2, 3, 4, 5 -> 4
// gas Legacy: 23882
// gas LegacyOptimized: 23266
// gas Yul: 24545
// gas YulOptimized: 23611
// g(uint256[],uint256,uint256,uint256): 0x80, 2, 4, 3, 5, 1, 2, 3, 4, 5 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23677
// gas LegacyOptimized: 23168
// gas Yul: 23949
// gas YulOptimized: 23340
// gg(uint256[],uint256,uint256,uint256): 0x80, 2, 4, 1, 5, 1, 2, 3, 4, 5 -> 4
// gas Legacy: 23926
// gas LegacyOptimized: 23310
// gas Yul: 24519
// gas YulOptimized: 23655
// gg(uint256[],uint256,uint256,uint256): 0x80, 2, 4, 3, 5, 1, 2, 3, 4, 5 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23721
// gas LegacyOptimized: 23212
// gas Yul: 23927
// gas YulOptimized: 23384
