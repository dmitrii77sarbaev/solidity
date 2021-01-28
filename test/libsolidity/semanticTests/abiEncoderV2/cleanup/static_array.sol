pragma abicoder               v2;

contract C {
    function gggggggg(uint8[2] calldata s) external pure returns (bytes memory) {
        s[0]; // only this will validate.
        return msg.data;
    }
    function f(uint256 a, uint256 b) public returns (bytes memory) {
        uint8[2] memory m = [0,0];
        assembly {
            mstore(m, a)
            mstore(add(m, 0x20), b)
        }
        return this.gggggggg(m);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256,uint256): 1, 1 -> 0x20, 0x44, hex"78b86ac6", 1, 1, hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 27788
// gas LegacyOptimized: 25703
// gas Yul: 29892
// gas YulOptimized: 26348
// gggggggg(uint8[2]): 1, 1 -> 0x20, 0x44, hex"78b86ac6", 1, 1, hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 22910
// gas LegacyOptimized: 22367
// gas Yul: 23675
// gas YulOptimized: 22599
// f(uint256,uint256): 0x0101, 0x0101 -> 0x20, 0x44, hex"78b86ac6", 1, 1, hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 27812
// gas LegacyOptimized: 25727
// gas Yul: 29916
// gas YulOptimized: 26372
// gggggggg(uint8[2]): 0x0101, 0x0101 -> FAILURE
// gas Legacy: 21955
// gas LegacyOptimized: 21714
// gas Yul: 22082
// gas YulOptimized: 21671
