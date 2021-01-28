pragma abicoder               v2;

contract C {
    struct S { uint8 a; bytes1 b; }
    function gg(S calldata s) external pure returns (bytes memory) {
        s.a; s.b; // only this will validate.
        return msg.data;
    }
    function f(uint256 a, bytes32 b) public returns (bytes memory) {
        S memory s = S(2,0x02);
        assembly {
            mstore(s, a)
            mstore(add(s, 0x20), b)
        }
        return this.gg(s);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256,bytes32): 1, left(0x01) -> 0x20, 0x44, hex"b63240b0", 1, left(0x01), hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 27533
// gas LegacyOptimized: 25659
// gas Yul: 29359
// gas YulOptimized: 26171
// gg((uint8,bytes1)): 1, left(0x01) -> 0x20, 0x44, hex"b63240b0", 1, left(0x01), hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 23140
// gas LegacyOptimized: 22476
// gas Yul: 23671
// gas YulOptimized: 22622
// f(uint256,bytes32): 0x0101, left(0x0101) -> 0x20, 0x44, hex"b63240b0", 1, left(0x01), hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 27557
// gas LegacyOptimized: 25683
// gas Yul: 29383
// gas YulOptimized: 26195
// gg((uint8,bytes1)): 0x0101, left(0x0101) -> FAILURE
// gas Legacy: 21916
// gas LegacyOptimized: 21682
// gas Yul: 21900
// gas YulOptimized: 21639
