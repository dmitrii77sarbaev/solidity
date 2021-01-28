contract C {
    function f(address a) public pure returns (bool) {
        return a == address(0);
    }
    function g() public pure returns (bool) {
        return bytes3("abc") == bytes4("abc");
    }
    function lt(uint a, uint b) public pure returns (bool) {
        return a < b;
    }
    function slt(int a, int b) public pure returns (bool) {
        return a < b;
    }
    function lte(uint a, uint b) public pure returns (bool) {
        return a <= b;
    }
    function slte(int a, int b) public pure returns (bool) {
        return a <= b;
    }
    function gt(uint a, uint b) public pure returns (bool) {
        return a > b;
    }
    function sgt(int a, int b) public pure returns (bool) {
        return a > b;
    }
    function gte(uint a, uint b) public pure returns (bool) {
        return a >= b;
    }
    function sgte(int a, int b) public pure returns (bool) {
        return a >= b;
    }
    function eq(uint a, uint b) public pure returns (bool) {
        return a == b;
    }
    function neq(uint a, uint b) public pure returns (bool) {
        return a != b;
    }
}
// ====
// compileViaYul: also
// ----
// f(address): 0x1234 -> false
// gas Legacy: 22001
// gas LegacyOptimized: 21701
// gas Yul: 22774
// gas YulOptimized: 21977
// f(address): 0x00 -> true
// gas Legacy: 21977
// gas LegacyOptimized: 21677
// gas Yul: 22750
// gas YulOptimized: 21953
// g() -> true
// gas Legacy: 21475
// gas LegacyOptimized: 21342
// gas Yul: 22194
// gas YulOptimized: 21622
// lt(uint256,uint256): 4, 5 -> true
// gas Legacy: 22132
// gas LegacyOptimized: 21679
// gas Yul: 22507
// gas YulOptimized: 21775
// lt(uint256,uint256): 5, 5 -> false
// gas Legacy: 22132
// gas LegacyOptimized: 21679
// gas Yul: 22507
// gas YulOptimized: 21775
// lt(uint256,uint256): 6, 5 -> false
// gas Legacy: 22132
// gas LegacyOptimized: 21679
// gas Yul: 22507
// gas YulOptimized: 21775
// gt(uint256,uint256): 4, 5 -> false
// gas Legacy: 22154
// gas LegacyOptimized: 21701
// gas Yul: 22529
// gas YulOptimized: 21797
// gt(uint256,uint256): 5, 5 -> false
// gas Legacy: 22154
// gas LegacyOptimized: 21701
// gas Yul: 22529
// gas YulOptimized: 21797
// gt(uint256,uint256): 6, 5 -> true
// gas Legacy: 22154
// gas LegacyOptimized: 21701
// gas Yul: 22529
// gas YulOptimized: 21797
// lte(uint256,uint256): 4, 5 -> true
// gas Legacy: 22222
// gas LegacyOptimized: 21769
// gas Yul: 22730
// gas YulOptimized: 21998
// lte(uint256,uint256): 5, 5 -> true
// gas Legacy: 22222
// gas LegacyOptimized: 21769
// gas Yul: 22730
// gas YulOptimized: 21998
// lte(uint256,uint256): 6, 5 -> false
// gas Legacy: 22222
// gas LegacyOptimized: 21769
// gas Yul: 22730
// gas YulOptimized: 21998
// gte(uint256,uint256): 4, 5 -> false
// gas Legacy: 22156
// gas LegacyOptimized: 21703
// gas Yul: 22664
// gas YulOptimized: 21932
// gte(uint256,uint256): 5, 5 -> true
// gas Legacy: 22156
// gas LegacyOptimized: 21703
// gas Yul: 22664
// gas YulOptimized: 21932
// gte(uint256,uint256): 6, 5 -> true
// gas Legacy: 22156
// gas LegacyOptimized: 21703
// gas Yul: 22664
// gas YulOptimized: 21932
// eq(uint256,uint256): 4, 5 -> false
// gas Legacy: 22198
// gas LegacyOptimized: 21745
// gas Yul: 22573
// gas YulOptimized: 21841
// eq(uint256,uint256): 5, 5 -> true
// gas Legacy: 22198
// gas LegacyOptimized: 21745
// gas Yul: 22573
// gas YulOptimized: 21841
// eq(uint256,uint256): 6, 5 -> false
// gas Legacy: 22198
// gas LegacyOptimized: 21745
// gas Yul: 22573
// gas YulOptimized: 21841
// neq(uint256,uint256): 4, 5 -> true
// gas Legacy: 22245
// gas LegacyOptimized: 21792
// gas Yul: 22620
// gas YulOptimized: 21888
// neq(uint256,uint256): 5, 5 -> false
// gas Legacy: 22245
// gas LegacyOptimized: 21792
// gas Yul: 22620
// gas YulOptimized: 21888
// neq(uint256,uint256): 6, 5 -> true
// gas Legacy: 22245
// gas LegacyOptimized: 21792
// gas Yul: 22620
// gas YulOptimized: 21888
// slt(int256,int256): -1, 0 -> true
// gas Legacy: 22580
// gas LegacyOptimized: 22127
// gas Yul: 22955
// gas YulOptimized: 22223
// slt(int256,int256): 0, 0 -> false
// gas Legacy: 22196
// gas LegacyOptimized: 21743
// gas Yul: 22571
// gas YulOptimized: 21839
// slt(int256,int256): 1, 0 -> false
// gas Legacy: 22208
// gas LegacyOptimized: 21755
// gas Yul: 22583
// gas YulOptimized: 21851
// sgt(int256,int256): -1, 0 -> false
// gas Legacy: 22536
// gas LegacyOptimized: 22083
// gas Yul: 22911
// gas YulOptimized: 22179
// sgt(int256,int256): 0, 0 -> false
// gas Legacy: 22152
// gas LegacyOptimized: 21699
// gas Yul: 22527
// gas YulOptimized: 21795
// sgt(int256,int256): 1, 0 -> true
// gas Legacy: 22164
// gas LegacyOptimized: 21711
// gas Yul: 22539
// gas YulOptimized: 21807
// slte(int256,int256): -1, 0 -> true
// gas Legacy: 22560
// gas LegacyOptimized: 22107
// gas Yul: 23068
// gas YulOptimized: 22336
// slte(int256,int256): 0, 0 -> true
// gas Legacy: 22176
// gas LegacyOptimized: 21723
// gas Yul: 22684
// gas YulOptimized: 21952
// slte(int256,int256): 1, 0 -> false
// gas Legacy: 22188
// gas LegacyOptimized: 21735
// gas Yul: 22696
// gas YulOptimized: 21964
// sgte(int256,int256): -1, 0 -> false
// gas Legacy: 22494
// gas LegacyOptimized: 22041
// gas Yul: 23002
// gas YulOptimized: 22270
// sgte(int256,int256): 0, 0 -> true
// gas Legacy: 22110
// gas LegacyOptimized: 21657
// gas Yul: 22618
// gas YulOptimized: 21886
// sgte(int256,int256): 1, 0 -> true
// gas Legacy: 22122
// gas LegacyOptimized: 21669
// gas Yul: 22630
// gas YulOptimized: 21898
