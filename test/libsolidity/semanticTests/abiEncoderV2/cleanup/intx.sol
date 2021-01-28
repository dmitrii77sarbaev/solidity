pragma abicoder               v2;

contract C {
    function ggg8(int8 x) external pure returns (int256) {
        return x;
    }
    function gg16(int16 x) external pure returns (int256) {
        return x;
    }
    function gg32(int32 x) external pure returns (int256) {
        return x;
    }
    function gg64(int64 x) external pure returns (int256) {
        return x;
    }
    function g128(int128 x) external pure returns (int256) {
        return x;
    }
    function f8(int256 a) external view returns (int256) {
        int8 x = 0;
        assembly { x := a }
        return this.ggg8(x);
    }
    function f16(int256 a) external view returns (int256) {
        int16 x = 0;
        assembly { x := a }
        return this.gg16(x);
    }
    function f32(int256 a) external view returns (int256) {
        int32 x = 0;
        assembly { x := a }
        return this.gg32(x);
    }
    function f64(int256 a) external view returns (int256) {
        int64 x = 0;
        assembly { x := a }
        return this.gg64(x);
    }
    function f128(int256 a) external view returns (int256) {
        int128 x = 0;
        assembly { x := a }
        return this.g128(x);
    }
}
// ====
// compileViaYul: also
// ----
// f8(int256): 0 -> 0
// gas Legacy: 24569
// gas LegacyOptimized: 23737
// gas Yul: 25754
// gas YulOptimized: 24153
// ggg8(int8): 0 -> 0 # test validation as well as sanity check #
// gas Legacy: 21876
// gas LegacyOptimized: 21604
// gas Yul: 22352
// gas YulOptimized: 21849
// f8(int256): 1 -> 1
// gas Legacy: 24581
// gas LegacyOptimized: 23749
// gas Yul: 25766
// gas YulOptimized: 24165
// ggg8(int8): 1 -> 1
// gas Legacy: 21888
// gas LegacyOptimized: 21616
// gas Yul: 22364
// gas YulOptimized: 21861
// f8(int256): -1 -> -1
// gas Legacy: 24953
// gas LegacyOptimized: 24121
// gas Yul: 26138
// gas YulOptimized: 24537
// ggg8(int8): -1 -> -1
// gas Legacy: 22260
// gas LegacyOptimized: 21988
// gas Yul: 22736
// gas YulOptimized: 22233
// f8(int256): 0x7F -> 0x7F
// gas Legacy: 24581
// gas LegacyOptimized: 23749
// gas Yul: 25766
// gas YulOptimized: 24165
// ggg8(int8): 0x7F -> 0x7F
// gas Legacy: 21888
// gas LegacyOptimized: 21616
// gas Yul: 22364
// gas YulOptimized: 21861
// f8(int256): 0x80 -> -128
// gas Legacy: 24581
// gas LegacyOptimized: 23749
// gas Yul: 25766
// gas YulOptimized: 24165
// ggg8(int8): 0x80 -> FAILURE
// gas Legacy: 21610
// gas LegacyOptimized: 21490
// gas Yul: 21726
// gas YulOptimized: 21588
// f8(int256): 0xFE -> -2
// gas Legacy: 24581
// gas LegacyOptimized: 23749
// gas Yul: 25766
// gas YulOptimized: 24165
// ggg8(int8): 0xFE -> FAILURE
// gas Legacy: 21610
// gas LegacyOptimized: 21490
// gas Yul: 21726
// gas YulOptimized: 21588
// f8(int256): 0xFF -> -1
// gas Legacy: 24581
// gas LegacyOptimized: 23749
// gas Yul: 25766
// gas YulOptimized: 24165
// ggg8(int8): 0xFF -> FAILURE
// gas Legacy: 21610
// gas LegacyOptimized: 21490
// gas Yul: 21726
// gas YulOptimized: 21588
// f8(int256): 0x0100 -> 0x00
// gas Legacy: 24581
// gas LegacyOptimized: 23749
// gas Yul: 25766
// gas YulOptimized: 24165
// ggg8(int8): 0x0100 -> FAILURE
// gas Legacy: 21610
// gas LegacyOptimized: 21490
// gas Yul: 21726
// gas YulOptimized: 21588
// f8(int256): 0x0101 -> 0x01
// gas Legacy: 24593
// gas LegacyOptimized: 23761
// gas Yul: 25778
// gas YulOptimized: 24177
// ggg8(int8): 0x0101 -> FAILURE
// gas Legacy: 21622
// gas LegacyOptimized: 21502
// gas Yul: 21738
// gas YulOptimized: 21600
// f8(int256): 0x01FF -> -1
// gas Legacy: 24593
// gas LegacyOptimized: 23761
// gas Yul: 25778
// gas YulOptimized: 24177
// ggg8(int8): 0x01FF -> FAILURE
// gas Legacy: 21622
// gas LegacyOptimized: 21502
// gas Yul: 21738
// gas YulOptimized: 21600
// f8(int256): 0x01FE -> -2
// gas Legacy: 24593
// gas LegacyOptimized: 23761
// gas Yul: 25778
// gas YulOptimized: 24177
// ggg8(int8): 0x01FE -> FAILURE
// gas Legacy: 21622
// gas LegacyOptimized: 21502
// gas Yul: 21738
// gas YulOptimized: 21600
// f16(int256): 0 -> 0
// gas Legacy: 24503
// gas LegacyOptimized: 23671
// gas Yul: 25688
// gas YulOptimized: 24131
// gg16(int16): 0 -> 0
// gas Legacy: 21898
// gas LegacyOptimized: 21626
// gas Yul: 22374
// gas YulOptimized: 21915
// f16(int256): 1 -> 1
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// gg16(int16): 1 -> 1
// gas Legacy: 21910
// gas LegacyOptimized: 21638
// gas Yul: 22386
// gas YulOptimized: 21927
// f16(int256): -1 -> -1
// gas Legacy: 24887
// gas LegacyOptimized: 24055
// gas Yul: 26072
// gas YulOptimized: 24515
// gg16(int16): -1 -> -1
// gas Legacy: 22282
// gas LegacyOptimized: 22010
// gas Yul: 22758
// gas YulOptimized: 22299
// f16(int256): 0x7FFF -> 0x7FFF
// gas Legacy: 24527
// gas LegacyOptimized: 23695
// gas Yul: 25712
// gas YulOptimized: 24155
// gg16(int16): 0x7FFF -> 0x7FFF
// gas Legacy: 21922
// gas LegacyOptimized: 21650
// gas Yul: 22398
// gas YulOptimized: 21939
// f16(int256): 0x8000 -> -32768
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// gg16(int16): 0x8000 -> FAILURE
// gas Legacy: 21632
// gas LegacyOptimized: 21512
// gas Yul: 21748
// gas YulOptimized: 21613
// f16(int256): 0xFFFE -> -2
// gas Legacy: 24527
// gas LegacyOptimized: 23695
// gas Yul: 25712
// gas YulOptimized: 24155
// gg16(int16): 0xFFFE -> FAILURE
// gas Legacy: 21644
// gas LegacyOptimized: 21524
// gas Yul: 21760
// gas YulOptimized: 21625
// f16(int256): 0xFFFF -> -1
// gas Legacy: 24527
// gas LegacyOptimized: 23695
// gas Yul: 25712
// gas YulOptimized: 24155
// gg16(int16): 0xFFFF -> FAILURE
// gas Legacy: 21644
// gas LegacyOptimized: 21524
// gas Yul: 21760
// gas YulOptimized: 21625
// f16(int256): 0x010000 -> 0x00
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// gg16(int16): 0x010000 -> FAILURE
// gas Legacy: 21632
// gas LegacyOptimized: 21512
// gas Yul: 21748
// gas YulOptimized: 21613
// f16(int256): 0x010001 -> 0x01
// gas Legacy: 24527
// gas LegacyOptimized: 23695
// gas Yul: 25712
// gas YulOptimized: 24155
// gg16(int16): 0x010001 -> FAILURE
// gas Legacy: 21644
// gas LegacyOptimized: 21524
// gas Yul: 21760
// gas YulOptimized: 21625
// f16(int256): 0x01FFFF -> -1
// gas Legacy: 24539
// gas LegacyOptimized: 23707
// gas Yul: 25724
// gas YulOptimized: 24167
// gg16(int16): 0x01FFFF -> FAILURE
// gas Legacy: 21656
// gas LegacyOptimized: 21536
// gas Yul: 21772
// gas YulOptimized: 21637
// f16(int256): 0x01FFFE -> -2
// gas Legacy: 24539
// gas LegacyOptimized: 23707
// gas Yul: 25724
// gas YulOptimized: 24167
// gg16(int16): 0x01FFFE -> FAILURE
// gas Legacy: 21656
// gas LegacyOptimized: 21536
// gas Yul: 21772
// gas YulOptimized: 21637
// f32(int256): 0 -> 0
// gas Legacy: 24503
// gas LegacyOptimized: 23671
// gas Yul: 25688
// gas YulOptimized: 24131
// gg32(int32): 0 -> 0
// gas Legacy: 21877
// gas LegacyOptimized: 21605
// gas Yul: 22242
// gas YulOptimized: 21783
// f32(int256): 1 -> 1
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// gg32(int32): 1 -> 1
// gas Legacy: 21889
// gas LegacyOptimized: 21617
// gas Yul: 22254
// gas YulOptimized: 21795
// f32(int256): -1 -> -1
// gas Legacy: 24887
// gas LegacyOptimized: 24055
// gas Yul: 26072
// gas YulOptimized: 24515
// gg32(int32): -1 -> -1
// gas Legacy: 22261
// gas LegacyOptimized: 21989
// gas Yul: 22626
// gas YulOptimized: 22167
// f32(int256): 0x7FFFFFFF -> 0x7FFFFFFF
// gas Legacy: 24551
// gas LegacyOptimized: 23719
// gas Yul: 25736
// gas YulOptimized: 24179
// gg32(int32): 0x7FFFFFFF -> 0x7FFFFFFF
// gas Legacy: 21925
// gas LegacyOptimized: 21653
// gas Yul: 22290
// gas YulOptimized: 21831
// f32(int256): 0x80000000 -> -2147483648
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// gg32(int32): 0x80000000 -> FAILURE
// gas Legacy: 21611
// gas LegacyOptimized: 21491
// gas Yul: 21616
// gas YulOptimized: 21481
// f32(int256): 0xFFFFFFFE -> -2
// gas Legacy: 24551
// gas LegacyOptimized: 23719
// gas Yul: 25736
// gas YulOptimized: 24179
// gg32(int32): 0xFFFFFFFE -> FAILURE
// gas Legacy: 21647
// gas LegacyOptimized: 21527
// gas Yul: 21652
// gas YulOptimized: 21517
// f32(int256): 0xFFFFFFFF -> -1
// gas Legacy: 24551
// gas LegacyOptimized: 23719
// gas Yul: 25736
// gas YulOptimized: 24179
// gg32(int32): 0xFFFFFFFF -> FAILURE
// gas Legacy: 21647
// gas LegacyOptimized: 21527
// gas Yul: 21652
// gas YulOptimized: 21517
// f32(int256): 0x0100000000 -> 0x00
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// gg32(int32): 0x0100000000 -> FAILURE
// gas Legacy: 21611
// gas LegacyOptimized: 21491
// gas Yul: 21616
// gas YulOptimized: 21481
// f32(int256): 0x0100000001 -> 0x01
// gas Legacy: 24527
// gas LegacyOptimized: 23695
// gas Yul: 25712
// gas YulOptimized: 24155
// gg32(int32): 0x0100000001 -> FAILURE
// gas Legacy: 21623
// gas LegacyOptimized: 21503
// gas Yul: 21628
// gas YulOptimized: 21493
// f32(int256): 0x01FFFFFFFF -> -1
// gas Legacy: 24563
// gas LegacyOptimized: 23731
// gas Yul: 25748
// gas YulOptimized: 24191
// gg32(int32): 0x01FFFFFFFF -> FAILURE
// gas Legacy: 21659
// gas LegacyOptimized: 21539
// gas Yul: 21664
// gas YulOptimized: 21529
// f32(int256): 0x01FFFFFFFE -> -2
// gas Legacy: 24563
// gas LegacyOptimized: 23731
// gas Yul: 25748
// gas YulOptimized: 24191
// gg32(int32): 0x01FFFFFFFE -> FAILURE
// gas Legacy: 21659
// gas LegacyOptimized: 21539
// gas Yul: 21664
// gas YulOptimized: 21529
// f64(int256): 0 -> 0
// gas Legacy: 24437
// gas LegacyOptimized: 23605
// gas Yul: 25622
// gas YulOptimized: 24065
// gg64(int64): 0 -> 0
// gas Legacy: 21810
// gas LegacyOptimized: 21538
// gas Yul: 22286
// gas YulOptimized: 21827
// f64(int256): 1 -> 1
// gas Legacy: 24449
// gas LegacyOptimized: 23617
// gas Yul: 25634
// gas YulOptimized: 24077
// gg64(int64): 1 -> 1
// gas Legacy: 21822
// gas LegacyOptimized: 21550
// gas Yul: 22298
// gas YulOptimized: 21839
// f64(int256): -1 -> -1
// gas Legacy: 24821
// gas LegacyOptimized: 23989
// gas Yul: 26006
// gas YulOptimized: 24449
// gg64(int64): -1 -> -1
// gas Legacy: 22194
// gas LegacyOptimized: 21922
// gas Yul: 22670
// gas YulOptimized: 22211
// f64(int256): 0x7FFFFFFFFFFFFFFF -> 0x7FFFFFFFFFFFFFFF
// gas Legacy: 24533
// gas LegacyOptimized: 23701
// gas Yul: 25718
// gas YulOptimized: 24161
// gg64(int64): 0x7FFFFFFFFFFFFFFF -> 0x7FFFFFFFFFFFFFFF
// gas Legacy: 21906
// gas LegacyOptimized: 21634
// gas Yul: 22382
// gas YulOptimized: 21923
// f64(int256): 0x8000000000000000 -> -9223372036854775808
// gas Legacy: 24449
// gas LegacyOptimized: 23617
// gas Yul: 25634
// gas YulOptimized: 24077
// gg64(int64): 0x8000000000000000 -> FAILURE
// gas Legacy: 21544
// gas LegacyOptimized: 21424
// gas Yul: 21660
// gas YulOptimized: 21525
// f64(int256): 0xFFFFFFFFFFFFFFFE -> -2
// gas Legacy: 24533
// gas LegacyOptimized: 23701
// gas Yul: 25718
// gas YulOptimized: 24161
// gg64(int64): 0xFFFFFFFFFFFFFFFE -> FAILURE
// gas Legacy: 21628
// gas LegacyOptimized: 21508
// gas Yul: 21744
// gas YulOptimized: 21609
// f64(int256): 0xFFFFFFFFFFFFFFFF -> -1
// gas Legacy: 24533
// gas LegacyOptimized: 23701
// gas Yul: 25718
// gas YulOptimized: 24161
// gg64(int64): 0xFFFFFFFFFFFFFFFF -> FAILURE
// gas Legacy: 21628
// gas LegacyOptimized: 21508
// gas Yul: 21744
// gas YulOptimized: 21609
// f64(int256): 0x010000000000000000 -> 0x00
// gas Legacy: 24449
// gas LegacyOptimized: 23617
// gas Yul: 25634
// gas YulOptimized: 24077
// gg64(int64): 0x010000000000000000 -> FAILURE
// gas Legacy: 21544
// gas LegacyOptimized: 21424
// gas Yul: 21660
// gas YulOptimized: 21525
// f64(int256): 0x010000000000000001 -> 0x01
// gas Legacy: 24461
// gas LegacyOptimized: 23629
// gas Yul: 25646
// gas YulOptimized: 24089
// gg64(int64): 0x010000000000000001 -> FAILURE
// gas Legacy: 21556
// gas LegacyOptimized: 21436
// gas Yul: 21672
// gas YulOptimized: 21537
// f64(int256): 0x01FFFFFFFFFFFFFFFF -> -1
// gas Legacy: 24545
// gas LegacyOptimized: 23713
// gas Yul: 25730
// gas YulOptimized: 24173
// gg64(int64): 0x01FFFFFFFFFFFFFFFF -> FAILURE
// gas Legacy: 21640
// gas LegacyOptimized: 21520
// gas Yul: 21756
// gas YulOptimized: 21621
// f64(int256): 0x01FFFFFFFFFFFFFFFE -> -2
// gas Legacy: 24545
// gas LegacyOptimized: 23713
// gas Yul: 25730
// gas YulOptimized: 24173
// gg64(int64): 0x01FFFFFFFFFFFFFFFE -> FAILURE
// gas Legacy: 21640
// gas LegacyOptimized: 21520
// gas Yul: 21756
// gas YulOptimized: 21621
// f128(int256): 0 -> 0
// gas Legacy: 24503
// gas LegacyOptimized: 23671
// gas Yul: 25688
// gas YulOptimized: 24131
// g128(int128): 0 -> 0
// gas Legacy: 21855
// gas LegacyOptimized: 21583
// gas Yul: 22220
// gas YulOptimized: 21761
// f128(int256): 1 -> 1
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// g128(int128): 1 -> 1
// gas Legacy: 21867
// gas LegacyOptimized: 21595
// gas Yul: 22232
// gas YulOptimized: 21773
// f128(int256): -1 -> -1
// gas Legacy: 24887
// gas LegacyOptimized: 24055
// gas Yul: 26072
// gas YulOptimized: 24515
// g128(int128): -1 -> -1
// gas Legacy: 22239
// gas LegacyOptimized: 21967
// gas Yul: 22604
// gas YulOptimized: 22145
// f128(int256): 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 24695
// gas LegacyOptimized: 23863
// gas Yul: 25880
// gas YulOptimized: 24323
// g128(int128): 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// gas Legacy: 22047
// gas LegacyOptimized: 21775
// gas Yul: 22412
// gas YulOptimized: 21953
// f128(int256): 0x80000000000000000000000000000000 -> -170141183460469231731687303715884105728
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// g128(int128): 0x80000000000000000000000000000000 -> FAILURE
// gas Legacy: 21589
// gas LegacyOptimized: 21469
// gas Yul: 21594
// gas YulOptimized: 21459
// f128(int256): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE -> -2
// gas Legacy: 24695
// gas LegacyOptimized: 23863
// gas Yul: 25880
// gas YulOptimized: 24323
// g128(int128): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE -> FAILURE
// gas Legacy: 21769
// gas LegacyOptimized: 21649
// gas Yul: 21774
// gas YulOptimized: 21639
// f128(int256): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> -1
// gas Legacy: 24695
// gas LegacyOptimized: 23863
// gas Yul: 25880
// gas YulOptimized: 24323
// g128(int128): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> FAILURE
// gas Legacy: 21769
// gas LegacyOptimized: 21649
// gas Yul: 21774
// gas YulOptimized: 21639
// f128(int256): 0x0100000000000000000000000000000000 -> 0x00
// gas Legacy: 24515
// gas LegacyOptimized: 23683
// gas Yul: 25700
// gas YulOptimized: 24143
// g128(int128): 0x0100000000000000000000000000000000 -> FAILURE
// gas Legacy: 21589
// gas LegacyOptimized: 21469
// gas Yul: 21594
// gas YulOptimized: 21459
// f128(int256): 0x0100000000000000000000000000000001 -> 0x01
// gas Legacy: 24527
// gas LegacyOptimized: 23695
// gas Yul: 25712
// gas YulOptimized: 24155
// g128(int128): 0x0100000000000000000000000000000001 -> FAILURE
// gas Legacy: 21601
// gas LegacyOptimized: 21481
// gas Yul: 21606
// gas YulOptimized: 21471
// f128(int256): 0x01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> -1
// gas Legacy: 24707
// gas LegacyOptimized: 23875
// gas Yul: 25892
// gas YulOptimized: 24335
// g128(int128): 0x01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> FAILURE
// gas Legacy: 21781
// gas LegacyOptimized: 21661
// gas Yul: 21786
// gas YulOptimized: 21651
// f128(int256): 0x01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE -> -2
// gas Legacy: 24707
// gas LegacyOptimized: 23875
// gas Yul: 25892
// gas YulOptimized: 24335
// g128(int128): 0x01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE -> FAILURE
// gas Legacy: 21781
// gas LegacyOptimized: 21661
// gas Yul: 21786
// gas YulOptimized: 21651
