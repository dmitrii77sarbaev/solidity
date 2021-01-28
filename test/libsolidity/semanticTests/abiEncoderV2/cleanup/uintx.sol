pragma abicoder               v2;

contract C {
    function ggg8(uint8 x) external pure returns (uint256) {
        return x;
    }
    function gg16(uint16 x) external pure returns (uint256) {
        return x;
    }
    function gg32(uint32 x) external pure returns (uint256) {
        return x;
    }
    function gg64(uint64 x) external pure returns (uint256) {
        return x;
    }
    function g128(uint128 x) external pure returns (uint256) {
        return x;
    }
    function f8(uint256 a) external view returns (uint256) {
        uint8 x = 0;
        assembly { x := a }
        return this.ggg8(x);
    }
    function f16(uint256 a) external view returns (uint256) {
        uint16 x = 0;
        assembly { x := a }
        return this.gg16(x);
    }
    function f32(uint256 a) external view returns (uint256) {
        uint32 x = 0;
        assembly { x := a }
        return this.gg32(x);
    }
    function f64(uint256 a) external view returns (uint256) {
        uint64 x = 0;
        assembly { x := a }
        return this.gg64(x);
    }
    function f128(uint256 a) external view returns (uint256) {
        uint128 x = 0;
        assembly { x := a }
        return this.g128(x);
    }
}
// ====
// compileViaYul: also
// ----
// f8(uint256): 0 -> 0
// gas Legacy: 24520
// gas LegacyOptimized: 23688
// gas Yul: 25592
// gas YulOptimized: 24037
// ggg8(uint8): 0 -> 0 # test validation as well as sanity check #
// gas Legacy: 21873
// gas LegacyOptimized: 21601
// gas Yul: 22238
// gas YulOptimized: 21779
// f8(uint256): 1 -> 1
// gas Legacy: 24532
// gas LegacyOptimized: 23700
// gas Yul: 25604
// gas YulOptimized: 24049
// ggg8(uint8): 1 -> 1
// gas Legacy: 21885
// gas LegacyOptimized: 21613
// gas Yul: 22250
// gas YulOptimized: 21791
// f8(uint256): 0xFE -> 0xFE
// gas Legacy: 24532
// gas LegacyOptimized: 23700
// gas Yul: 25604
// gas YulOptimized: 24049
// ggg8(uint8): 0xFE -> 0xFE
// gas Legacy: 21885
// gas LegacyOptimized: 21613
// gas Yul: 22250
// gas YulOptimized: 21791
// f8(uint256): 0xFF -> 0xFF
// gas Legacy: 24532
// gas LegacyOptimized: 23700
// gas Yul: 25604
// gas YulOptimized: 24049
// ggg8(uint8): 0xFF -> 0xFF
// gas Legacy: 21885
// gas LegacyOptimized: 21613
// gas Yul: 22250
// gas YulOptimized: 21791
// f8(uint256): 0x0100 -> 0x00
// gas Legacy: 24532
// gas LegacyOptimized: 23700
// gas Yul: 25604
// gas YulOptimized: 24049
// ggg8(uint8): 0x0100 -> FAILURE
// gas Legacy: 21609
// gas LegacyOptimized: 21489
// gas Yul: 21614
// gas YulOptimized: 21479
// f8(uint256): 0x0101 -> 0x01
// gas Legacy: 24544
// gas LegacyOptimized: 23712
// gas Yul: 25616
// gas YulOptimized: 24061
// ggg8(uint8): 0x0101 -> FAILURE
// gas Legacy: 21621
// gas LegacyOptimized: 21501
// gas Yul: 21626
// gas YulOptimized: 21491
// f8(uint256): -1 -> 0xFF
// gas Legacy: 24904
// gas LegacyOptimized: 24072
// gas Yul: 25976
// gas YulOptimized: 24421
// ggg8(uint8): -1 -> FAILURE
// gas Legacy: 21981
// gas LegacyOptimized: 21861
// gas Yul: 21986
// gas YulOptimized: 21851
// f16(uint256): 0 -> 0
// gas Legacy: 24452
// gas LegacyOptimized: 23620
// gas Yul: 25746
// gas YulOptimized: 24191
// gg16(uint16): 0 -> 0
// gas Legacy: 21806
// gas LegacyOptimized: 21534
// gas Yul: 22282
// gas YulOptimized: 21823
// f16(uint256): 1 -> 1
// gas Legacy: 24464
// gas LegacyOptimized: 23632
// gas Yul: 25758
// gas YulOptimized: 24203
// gg16(uint16): 1 -> 1
// gas Legacy: 21818
// gas LegacyOptimized: 21546
// gas Yul: 22294
// gas YulOptimized: 21835
// f16(uint256): 0xFFFE -> 0xFFFE
// gas Legacy: 24476
// gas LegacyOptimized: 23644
// gas Yul: 25770
// gas YulOptimized: 24215
// gg16(uint16): 0xFFFE -> 0xFFFE
// gas Legacy: 21830
// gas LegacyOptimized: 21558
// gas Yul: 22306
// gas YulOptimized: 21847
// f16(uint256): 0xFFFF -> 0xFFFF
// gas Legacy: 24476
// gas LegacyOptimized: 23644
// gas Yul: 25770
// gas YulOptimized: 24215
// gg16(uint16): 0xFFFF -> 0xFFFF
// gas Legacy: 21830
// gas LegacyOptimized: 21558
// gas Yul: 22306
// gas YulOptimized: 21847
// f16(uint256): 0x010000 -> 0x0000
// gas Legacy: 24464
// gas LegacyOptimized: 23632
// gas Yul: 25758
// gas YulOptimized: 24203
// gg16(uint16): 0x010000 -> FAILURE
// gas Legacy: 21542
// gas LegacyOptimized: 21422
// gas Yul: 21658
// gas YulOptimized: 21523
// f16(uint256): 0x010001 -> 0x0001
// gas Legacy: 24476
// gas LegacyOptimized: 23644
// gas Yul: 25770
// gas YulOptimized: 24215
// gg16(uint16): 0x010001 -> FAILURE
// gas Legacy: 21554
// gas LegacyOptimized: 21434
// gas Yul: 21670
// gas YulOptimized: 21535
// f16(uint256): -1 -> 0xFFFF
// gas Legacy: 24836
// gas LegacyOptimized: 24004
// gas Yul: 26130
// gas YulOptimized: 24575
// gg16(uint16): -1 -> FAILURE
// gas Legacy: 21914
// gas LegacyOptimized: 21794
// gas Yul: 22030
// gas YulOptimized: 21895
// f32(uint256): 0 -> 0
// gas Legacy: 24453
// gas LegacyOptimized: 23621
// gas Yul: 25636
// gas YulOptimized: 24081
// gg32(uint32): 0 -> 0
// gas Legacy: 21828
// gas LegacyOptimized: 21556
// gas Yul: 22304
// gas YulOptimized: 21845
// f32(uint256): 1 -> 1
// gas Legacy: 24465
// gas LegacyOptimized: 23633
// gas Yul: 25648
// gas YulOptimized: 24093
// gg32(uint32): 1 -> 1
// gas Legacy: 21840
// gas LegacyOptimized: 21568
// gas Yul: 22316
// gas YulOptimized: 21857
// f32(uint256): 0xFFFFFFFE -> 0xFFFFFFFE
// gas Legacy: 24501
// gas LegacyOptimized: 23669
// gas Yul: 25684
// gas YulOptimized: 24129
// gg32(uint32): 0xFFFFFFFE -> 0xFFFFFFFE
// gas Legacy: 21876
// gas LegacyOptimized: 21604
// gas Yul: 22352
// gas YulOptimized: 21893
// f32(uint256): 0xFFFFFFFF -> 0xFFFFFFFF
// gas Legacy: 24501
// gas LegacyOptimized: 23669
// gas Yul: 25684
// gas YulOptimized: 24129
// gg32(uint32): 0xFFFFFFFF -> 0xFFFFFFFF
// gas Legacy: 21876
// gas LegacyOptimized: 21604
// gas Yul: 22352
// gas YulOptimized: 21893
// f32(uint256): 0x0100000000 -> 0x00000000
// gas Legacy: 24465
// gas LegacyOptimized: 23633
// gas Yul: 25648
// gas YulOptimized: 24093
// gg32(uint32): 0x0100000000 -> FAILURE
// gas Legacy: 21564
// gas LegacyOptimized: 21444
// gas Yul: 21680
// gas YulOptimized: 21545
// f32(uint256): 0x0100000001 -> 0x00000001
// gas Legacy: 24477
// gas LegacyOptimized: 23645
// gas Yul: 25660
// gas YulOptimized: 24105
// gg32(uint32): 0x0100000001 -> FAILURE
// gas Legacy: 21576
// gas LegacyOptimized: 21456
// gas Yul: 21692
// gas YulOptimized: 21557
// f32(uint256): -1 -> 0xFFFFFFFF
// gas Legacy: 24837
// gas LegacyOptimized: 24005
// gas Yul: 26020
// gas YulOptimized: 24465
// gg32(uint32): -1 -> FAILURE
// gas Legacy: 21936
// gas LegacyOptimized: 21816
// gas Yul: 22052
// gas YulOptimized: 21917
// f64(uint256): 0 -> 0
// gas Legacy: 24475
// gas LegacyOptimized: 23643
// gas Yul: 25658
// gas YulOptimized: 24103
// gg64(uint64): 0 -> 0
// gas Legacy: 21872
// gas LegacyOptimized: 21600
// gas Yul: 22348
// gas YulOptimized: 21889
// f64(uint256): 1 -> 1
// gas Legacy: 24487
// gas LegacyOptimized: 23655
// gas Yul: 25670
// gas YulOptimized: 24115
// gg64(uint64): 1 -> 1
// gas Legacy: 21884
// gas LegacyOptimized: 21612
// gas Yul: 22360
// gas YulOptimized: 21901
// f64(uint256): 0xFFFFFFFFFFFFFFFE -> 0xFFFFFFFFFFFFFFFE
// gas Legacy: 24571
// gas LegacyOptimized: 23739
// gas Yul: 25754
// gas YulOptimized: 24199
// gg64(uint64): 0xFFFFFFFFFFFFFFFE -> 0xFFFFFFFFFFFFFFFE
// gas Legacy: 21968
// gas LegacyOptimized: 21696
// gas Yul: 22444
// gas YulOptimized: 21985
// f64(uint256): 0xFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFF
// gas Legacy: 24571
// gas LegacyOptimized: 23739
// gas Yul: 25754
// gas YulOptimized: 24199
// gg64(uint64): 0xFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFF
// gas Legacy: 21968
// gas LegacyOptimized: 21696
// gas Yul: 22444
// gas YulOptimized: 21985
// f64(uint256): 0x010000000000000000 -> 0x0000000000000000
// gas Legacy: 24487
// gas LegacyOptimized: 23655
// gas Yul: 25670
// gas YulOptimized: 24115
// gg64(uint64): 0x010000000000000000 -> FAILURE
// gas Legacy: 21608
// gas LegacyOptimized: 21488
// gas Yul: 21724
// gas YulOptimized: 21589
// f64(uint256): 0x010000000000000001 -> 0x0000000000000001
// gas Legacy: 24499
// gas LegacyOptimized: 23667
// gas Yul: 25682
// gas YulOptimized: 24127
// gg64(uint64): 0x010000000000000001 -> FAILURE
// gas Legacy: 21620
// gas LegacyOptimized: 21500
// gas Yul: 21736
// gas YulOptimized: 21601
// f64(uint256): -1 -> 0xFFFFFFFFFFFFFFFF
// gas Legacy: 24859
// gas LegacyOptimized: 24027
// gas Yul: 26042
// gas YulOptimized: 24487
// gg64(uint64): -1 -> FAILURE
// gas Legacy: 21980
// gas LegacyOptimized: 21860
// gas Yul: 22096
// gas YulOptimized: 21961
// f128(uint256): 0 -> 0
// gas Legacy: 24585
// gas LegacyOptimized: 23789
// gas Yul: 25768
// gas YulOptimized: 24213
// g128(uint128): 0 -> 0
// gas Legacy: 21894
// gas LegacyOptimized: 21646
// gas Yul: 22370
// gas YulOptimized: 21911
// f128(uint256): 1 -> 1
// gas Legacy: 24597
// gas LegacyOptimized: 23801
// gas Yul: 25780
// gas YulOptimized: 24225
// g128(uint128): 1 -> 1
// gas Legacy: 21906
// gas LegacyOptimized: 21658
// gas Yul: 22382
// gas YulOptimized: 21923
// f128(uint256): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
// gas Legacy: 24777
// gas LegacyOptimized: 23981
// gas Yul: 25960
// gas YulOptimized: 24405
// g128(uint128): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
// gas Legacy: 22086
// gas LegacyOptimized: 21838
// gas Yul: 22562
// gas YulOptimized: 22103
// f128(uint256): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 24777
// gas LegacyOptimized: 23981
// gas Yul: 25960
// gas YulOptimized: 24405
// g128(uint128): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 22086
// gas LegacyOptimized: 21838
// gas Yul: 22562
// gas YulOptimized: 22103
// f128(uint256): 0x0100000000000000000000000000000000 -> 0x00000000000000000000000000000000
// gas Legacy: 24597
// gas LegacyOptimized: 23801
// gas Yul: 25780
// gas YulOptimized: 24225
// g128(uint128): 0x0100000000000000000000000000000000 -> FAILURE
// gas Legacy: 21630
// gas LegacyOptimized: 21522
// gas Yul: 21746
// gas YulOptimized: 21611
// f128(uint256): 0x0100000000000000000000000000000001 -> 0x00000000000000000000000000000001
// gas Legacy: 24609
// gas LegacyOptimized: 23813
// gas Yul: 25792
// gas YulOptimized: 24237
// g128(uint128): 0x0100000000000000000000000000000001 -> FAILURE
// gas Legacy: 21642
// gas LegacyOptimized: 21534
// gas Yul: 21758
// gas YulOptimized: 21623
// f128(uint256): -1 -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 24969
// gas LegacyOptimized: 24173
// gas Yul: 26152
// gas YulOptimized: 24597
// g128(uint128): -1 -> FAILURE
// gas Legacy: 22002
// gas LegacyOptimized: 21894
// gas Yul: 22118
// gas YulOptimized: 21983
