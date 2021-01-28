pragma abicoder               v2;

contract C {
    function gg1(bytes1 x) external pure returns (bytes32) {
        return x;
    }
    function f1(bytes32 a) external view returns (bytes32) {
        bytes1 x;
        assembly { x := a }
        return this.gg1(x);
    }
    function gg2(bytes2 x) external pure returns (bytes32) {
        return x;
    }
    function f2(bytes32 a) external view returns (bytes32) {
        bytes2 x;
        assembly { x := a }
        return this.gg2(x);
    }
    function gg4(bytes4 x) external pure returns (bytes32) {
        return x;
    }
    function f4(bytes32 a) external view returns (bytes32) {
        bytes4 x;
        assembly { x := a }
        return this.gg4(x);
    }
    function gg8(bytes8 x) external pure returns (bytes32) {
        return x;
    }
    function f8(bytes32 a) external view returns (bytes32) {
        bytes8 x;
        assembly { x := a }
        return this.gg8(x);
    }
    function g16(bytes16 x) external pure returns (bytes32) {
        return x;
    }
    function f16(bytes32 a) external view returns (bytes32) {
        bytes16 x;
        assembly { x := a }
        return this.g16(x);
    }
}
// ====
// compileViaYul: also
// ----
// f1(bytes32): left(0) -> left(0)
// gas Legacy: 24470
// gas LegacyOptimized: 23688
// gas Yul: 25626
// gas YulOptimized: 24121
// gg1(bytes1): left(0) -> left(0) # test validation as well as sanity check #
// gas Legacy: 21809
// gas LegacyOptimized: 21564
// gas Yul: 22294
// gas YulOptimized: 21835
// f1(bytes32): left(1) -> left(1)
// gas Legacy: 24482
// gas LegacyOptimized: 23700
// gas Yul: 25638
// gas YulOptimized: 24133
// gg1(bytes1): left(1) -> left(1)
// gas Legacy: 21821
// gas LegacyOptimized: 21576
// gas Yul: 22306
// gas YulOptimized: 21847
// f1(bytes32): left(0xFE) -> left(0xFE)
// gas Legacy: 24482
// gas LegacyOptimized: 23700
// gas Yul: 25638
// gas YulOptimized: 24133
// gg1(bytes1): left(0xFE) -> left(0xFE)
// gas Legacy: 21821
// gas LegacyOptimized: 21576
// gas Yul: 22306
// gas YulOptimized: 21847
// f1(bytes32): left(0xFF) -> left(0xFF)
// gas Legacy: 24482
// gas LegacyOptimized: 23700
// gas Yul: 25638
// gas YulOptimized: 24133
// gg1(bytes1): left(0xFF) -> left(0xFF)
// gas Legacy: 21821
// gas LegacyOptimized: 21576
// gas Yul: 22306
// gas YulOptimized: 21847
// f1(bytes32): left(0x0001) -> left(0x00)
// gas Legacy: 24482
// gas LegacyOptimized: 23700
// gas Yul: 25638
// gas YulOptimized: 24133
// gg1(bytes1): left(0x0001) -> FAILURE
// gas Legacy: 21542
// gas LegacyOptimized: 21437
// gas Yul: 21664
// gas YulOptimized: 21529
// f1(bytes32): left(0x0101) -> left(0x01)
// gas Legacy: 24494
// gas LegacyOptimized: 23712
// gas Yul: 25650
// gas YulOptimized: 24145
// gg1(bytes1): left(0x0101) -> FAILURE
// gas Legacy: 21554
// gas LegacyOptimized: 21449
// gas Yul: 21676
// gas YulOptimized: 21541
// f1(bytes32): -1 -> left(0xFF)
// gas Legacy: 24854
// gas LegacyOptimized: 24072
// gas Yul: 26010
// gas YulOptimized: 24505
// gg1(bytes1): -1 -> FAILURE
// gas Legacy: 21914
// gas LegacyOptimized: 21809
// gas Yul: 22036
// gas YulOptimized: 21901
// f2(bytes32): left(0) -> left(0)
// gas Legacy: 24470
// gas LegacyOptimized: 23688
// gas Yul: 25626
// gas YulOptimized: 24121
// gg2(bytes2): left(0) -> left(0)
// gas Legacy: 21875
// gas LegacyOptimized: 21630
// gas Yul: 22360
// gas YulOptimized: 21901
// f2(bytes32): left(1) -> left(1)
// gas Legacy: 24482
// gas LegacyOptimized: 23700
// gas Yul: 25638
// gas YulOptimized: 24133
// gg2(bytes2): left(1) -> left(1)
// gas Legacy: 21887
// gas LegacyOptimized: 21642
// gas Yul: 22372
// gas YulOptimized: 21913
// f2(bytes32): left(0xFFFE) -> left(0xFFFE)
// gas Legacy: 24494
// gas LegacyOptimized: 23712
// gas Yul: 25650
// gas YulOptimized: 24145
// gg2(bytes2): left(0xFFFE) -> left(0xFFFE)
// gas Legacy: 21899
// gas LegacyOptimized: 21654
// gas Yul: 22384
// gas YulOptimized: 21925
// f2(bytes32): left(0xFFFF) -> left(0xFFFF)
// gas Legacy: 24494
// gas LegacyOptimized: 23712
// gas Yul: 25650
// gas YulOptimized: 24145
// gg2(bytes2): left(0xFFFF) -> left(0xFFFF)
// gas Legacy: 21899
// gas LegacyOptimized: 21654
// gas Yul: 22384
// gas YulOptimized: 21925
// f2(bytes32): left(0x000001) -> left(0x00)
// gas Legacy: 24482
// gas LegacyOptimized: 23700
// gas Yul: 25638
// gas YulOptimized: 24133
// gg2(bytes2): left(0x000001) -> FAILURE
// gas Legacy: 21608
// gas LegacyOptimized: 21503
// gas Yul: 21730
// gas YulOptimized: 21595
// f2(bytes32): left(0x010001) -> left(0x01)
// gas Legacy: 24494
// gas LegacyOptimized: 23712
// gas Yul: 25650
// gas YulOptimized: 24145
// gg2(bytes2): left(0x010001) -> FAILURE
// gas Legacy: 21620
// gas LegacyOptimized: 21515
// gas Yul: 21742
// gas YulOptimized: 21607
// f2(bytes32): -1 -> left(0xFFFF)
// gas Legacy: 24854
// gas LegacyOptimized: 24072
// gas Yul: 26010
// gas YulOptimized: 24505
// gg2(bytes2): -1 -> FAILURE
// gas Legacy: 21980
// gas LegacyOptimized: 21875
// gas Yul: 22102
// gas YulOptimized: 21967
// f4(bytes32): left(0) -> left(0)
// gas Legacy: 24492
// gas LegacyOptimized: 23710
// gas Yul: 25648
// gas YulOptimized: 24143
// gg4(bytes4): left(0) -> left(0)
// gas Legacy: 21854
// gas LegacyOptimized: 21609
// gas Yul: 22228
// gas YulOptimized: 21769
// f4(bytes32): left(1) -> left(1)
// gas Legacy: 24504
// gas LegacyOptimized: 23722
// gas Yul: 25660
// gas YulOptimized: 24155
// gg4(bytes4): left(1) -> left(1)
// gas Legacy: 21866
// gas LegacyOptimized: 21621
// gas Yul: 22240
// gas YulOptimized: 21781
// f4(bytes32): left(0xFFFFFFFE) -> left(0xFFFFFFFE)
// gas Legacy: 24540
// gas LegacyOptimized: 23758
// gas Yul: 25696
// gas YulOptimized: 24191
// gg4(bytes4): left(0xFFFFFFFE) -> left(0xFFFFFFFE)
// gas Legacy: 21902
// gas LegacyOptimized: 21657
// gas Yul: 22276
// gas YulOptimized: 21817
// f4(bytes32): left(0xFFFFFFFF) -> left(0xFFFFFFFF)
// gas Legacy: 24540
// gas LegacyOptimized: 23758
// gas Yul: 25696
// gas YulOptimized: 24191
// gg4(bytes4): left(0xFFFFFFFF) -> left(0xFFFFFFFF)
// gas Legacy: 21902
// gas LegacyOptimized: 21657
// gas Yul: 22276
// gas YulOptimized: 21817
// f4(bytes32): left(0x0000000001) -> left(0x00)
// gas Legacy: 24504
// gas LegacyOptimized: 23722
// gas Yul: 25660
// gas YulOptimized: 24155
// gg4(bytes4): left(0x0000000001) -> FAILURE
// gas Legacy: 21587
// gas LegacyOptimized: 21482
// gas Yul: 21598
// gas YulOptimized: 21463
// f4(bytes32): left(0x0100000001) -> left(0x01)
// gas Legacy: 24516
// gas LegacyOptimized: 23734
// gas Yul: 25672
// gas YulOptimized: 24167
// gg4(bytes4): left(0x0100000001) -> FAILURE
// gas Legacy: 21599
// gas LegacyOptimized: 21494
// gas Yul: 21610
// gas YulOptimized: 21475
// f4(bytes32): -1 -> left(0xFFFFFFFF)
// gas Legacy: 24876
// gas LegacyOptimized: 24094
// gas Yul: 26032
// gas YulOptimized: 24527
// gg4(bytes4): -1 -> FAILURE
// gas Legacy: 21959
// gas LegacyOptimized: 21854
// gas Yul: 21970
// gas YulOptimized: 21835
// f8(bytes32): left(0) -> left(0)
// gas Legacy: 24513
// gas LegacyOptimized: 23731
// gas Yul: 25780
// gas YulOptimized: 24275
// gg8(bytes8): left(0) -> left(0)
// gas Legacy: 21831
// gas LegacyOptimized: 21586
// gas Yul: 22316
// gas YulOptimized: 21857
// f8(bytes32): left(1) -> left(1)
// gas Legacy: 24525
// gas LegacyOptimized: 23743
// gas Yul: 25792
// gas YulOptimized: 24287
// gg8(bytes8): left(1) -> left(1)
// gas Legacy: 21843
// gas LegacyOptimized: 21598
// gas Yul: 22328
// gas YulOptimized: 21869
// f8(bytes32): left(0xFFFFFFFFFFFFFFFE) -> left(0xFFFFFFFFFFFFFFFE)
// gas Legacy: 24609
// gas LegacyOptimized: 23827
// gas Yul: 25876
// gas YulOptimized: 24371
// gg8(bytes8): left(0xFFFFFFFFFFFFFFFE) -> left(0xFFFFFFFFFFFFFFFE)
// gas Legacy: 21927
// gas LegacyOptimized: 21682
// gas Yul: 22412
// gas YulOptimized: 21953
// f8(bytes32): left(0xFFFFFFFFFFFFFFFF) -> left(0xFFFFFFFFFFFFFFFF)
// gas Legacy: 24609
// gas LegacyOptimized: 23827
// gas Yul: 25876
// gas YulOptimized: 24371
// gg8(bytes8): left(0xFFFFFFFFFFFFFFFF) -> left(0xFFFFFFFFFFFFFFFF)
// gas Legacy: 21927
// gas LegacyOptimized: 21682
// gas Yul: 22412
// gas YulOptimized: 21953
// f8(bytes32): left(0x000000000000000001) -> left(0x00)
// gas Legacy: 24525
// gas LegacyOptimized: 23743
// gas Yul: 25792
// gas YulOptimized: 24287
// gg8(bytes8): left(0x000000000000000001) -> FAILURE
// gas Legacy: 21564
// gas LegacyOptimized: 21459
// gas Yul: 21686
// gas YulOptimized: 21551
// f8(bytes32): left(0x010000000000000001) -> left(0x01)
// gas Legacy: 24537
// gas LegacyOptimized: 23755
// gas Yul: 25804
// gas YulOptimized: 24299
// gg8(bytes8): left(0x010000000000000001) -> FAILURE
// gas Legacy: 21576
// gas LegacyOptimized: 21471
// gas Yul: 21698
// gas YulOptimized: 21563
// f8(bytes32): -1 -> left(0xFFFFFFFFFFFFFFFF)
// gas Legacy: 24897
// gas LegacyOptimized: 24115
// gas Yul: 26164
// gas YulOptimized: 24659
// gg8(bytes8): -1 -> FAILURE
// gas Legacy: 21936
// gas LegacyOptimized: 21831
// gas Yul: 22058
// gas YulOptimized: 21923
// f16(bytes32): left(0) -> left(0)
// gas Legacy: 24515
// gas LegacyOptimized: 23733
// gas Yul: 25551
// gas YulOptimized: 24046
// g16(bytes16): left(0) -> left(0)
// gas Legacy: 21898
// gas LegacyOptimized: 21653
// gas Yul: 22266
// gas YulOptimized: 21807
// f16(bytes32): left(1) -> left(1)
// gas Legacy: 24527
// gas LegacyOptimized: 23745
// gas Yul: 25563
// gas YulOptimized: 24058
// g16(bytes16): left(1) -> left(1)
// gas Legacy: 21910
// gas LegacyOptimized: 21665
// gas Yul: 22278
// gas YulOptimized: 21819
// f16(bytes32): left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE) -> left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE)
// gas Legacy: 24707
// gas LegacyOptimized: 23925
// gas Yul: 25743
// gas YulOptimized: 24238
// g16(bytes16): left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE) -> left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE)
// gas Legacy: 22090
// gas LegacyOptimized: 21845
// gas Yul: 22458
// gas YulOptimized: 21999
// f16(bytes32): left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF) -> left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
// gas Legacy: 24707
// gas LegacyOptimized: 23925
// gas Yul: 25743
// gas YulOptimized: 24238
// g16(bytes16): left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF) -> left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
// gas Legacy: 22090
// gas LegacyOptimized: 21845
// gas Yul: 22458
// gas YulOptimized: 21999
// f16(bytes32): left(0x0000000000000000000000000000000001) -> left(0x00)
// gas Legacy: 24527
// gas LegacyOptimized: 23745
// gas Yul: 25563
// gas YulOptimized: 24058
// g16(bytes16): left(0x0000000000000000000000000000000001) -> FAILURE
// gas Legacy: 21631
// gas LegacyOptimized: 21526
// gas Yul: 21639
// gas YulOptimized: 21504
// f16(bytes32): left(0x0100000000000000000000000000000001) -> left(0x01)
// gas Legacy: 24539
// gas LegacyOptimized: 23757
// gas Yul: 25575
// gas YulOptimized: 24070
// g16(bytes16): left(0x0100000000000000000000000000000001) -> FAILURE
// gas Legacy: 21643
// gas LegacyOptimized: 21538
// gas Yul: 21651
// gas YulOptimized: 21516
// f16(bytes32): -1 -> left(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
// gas Legacy: 24899
// gas LegacyOptimized: 24117
// gas Yul: 25935
// gas YulOptimized: 24430
// g16(bytes16): -1 -> FAILURE
// gas Legacy: 22003
// gas LegacyOptimized: 21898
// gas Yul: 22011
// gas YulOptimized: 21876
