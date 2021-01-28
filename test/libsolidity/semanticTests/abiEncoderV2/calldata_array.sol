pragma abicoder               v2;

contract C {
    function g(uint256[] calldata) external pure returns (bytes memory) {
        return msg.data;
    }
    function f(uint256[][1] calldata s) external view returns (bool) {
        bytes memory a = this.g(s[0]);
        uint256[] memory m = s[0];
        bytes memory b = this.g(m);
        assert(a.length == b.length);
        for (uint i = 0; i < a.length; i++)
            assert(a[i] == b[i]);
        return true;
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256[][1]): 32, 32, 0 -> true
// gas Legacy: 53967
// gas LegacyOptimized: 48434
// gas Yul: 105308
// gas YulOptimized: 71146
// f(uint256[][1]): 32, 32, 1, 42 -> true
// gas Legacy: 65256
// gas LegacyOptimized: 57906
// gas Yul: 139370
// gas YulOptimized: 90708
// f(uint256[][1]): 32, 32, 8, 421, 422, 423, 424, 425, 426, 427, 428 -> true
// gas Legacy: 144300
// gas LegacyOptimized: 124231
// gas Yul: 377825
// gas YulOptimized: 227663
