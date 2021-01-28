contract C {
    function shl_zero(uint256 a) public returns (uint256 c) {
        assembly {
            c := shl(0, a)
        }
    }

    function shr_zero(uint256 a) public returns (uint256 c) {
        assembly {
            c := shr(0, a)
        }
    }

    function sar_zero(uint256 a) public returns (uint256 c) {
        assembly {
            c := sar(0, a)
        }
    }

    function shl_large(uint256 a) public returns (uint256 c) {
        assembly {
            c := shl(0x110, a)
        }
    }

    function shr_large(uint256 a) public returns (uint256 c) {
        assembly {
            c := shr(0x110, a)
        }
    }

    function sar_large(uint256 a) public returns (uint256 c) {
        assembly {
            c := sar(0x110, a)
        }
    }

    function shl_combined(uint256 a) public returns (uint256 c) {
        assembly {
            c := shl(4, shl(12, a))
        }
    }

    function shr_combined(uint256 a) public returns (uint256 c) {
        assembly {
            c := shr(4, shr(12, a))
        }
    }

    function sar_combined(uint256 a) public returns (uint256 c) {
        assembly {
            c := sar(4, sar(12, a))
        }
    }

    function shl_combined_large(uint256 a) public returns (uint256 c) {
        assembly {
            c := shl(0xd0, shl(0x40, a))
        }
    }

    function shl_combined_overflow(uint256 a) public returns (uint256 c) {
        assembly {
            c := shl(0x01, shl(not(0x00), a))
        }
    }

    function shr_combined_large(uint256 a) public returns (uint256 c) {
        assembly {
            c := shr(0xd0, shr(0x40, a))
        }
    }

    function shr_combined_overflow(uint256 a) public returns (uint256 c) {
        assembly {
            c := shr(0x01, shr(not(0x00), a))
        }
    }

    function sar_combined_large(uint256 a) public returns (uint256 c) {
        assembly {
            c := sar(0xd0, sar(0x40, a))
        }
    }
}
// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// shl_zero(uint256): 0x00 -> 0x00
// gas Legacy: 21867
// gas LegacyOptimized: 21561
// gas Yul: 22188
// gas YulOptimized: 21698
// shl_zero(uint256): 0xffff -> 0xffff
// gas Legacy: 21891
// gas LegacyOptimized: 21585
// gas Yul: 22212
// gas YulOptimized: 21722
// shl_zero(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22251
// gas LegacyOptimized: 21945
// gas Yul: 22572
// gas YulOptimized: 22082
// shr_zero(uint256): 0x00 -> 0x00
// gas Legacy: 21868
// gas LegacyOptimized: 21562
// gas Yul: 22122
// gas YulOptimized: 21632
// shr_zero(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22252
// gas LegacyOptimized: 21946
// gas Yul: 22506
// gas YulOptimized: 22016
// sar_zero(uint256): 0x00 -> 0x00
// gas Legacy: 21846
// gas LegacyOptimized: 21546
// gas Yul: 22100
// gas YulOptimized: 21616
// sar_zero(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22230
// gas LegacyOptimized: 21930
// gas Yul: 22484
// gas YulOptimized: 22000
// shl_large(uint256): 0x00 -> 0x00
// gas Legacy: 21824
// gas LegacyOptimized: 21523
// gas Yul: 22078
// gas YulOptimized: 21590
// shl_large(uint256): 0xffff -> 0x00
// gas Legacy: 21848
// gas LegacyOptimized: 21547
// gas Yul: 22102
// gas YulOptimized: 21614
// shl_large(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0x00
// gas Legacy: 22208
// gas LegacyOptimized: 21907
// gas Yul: 22462
// gas YulOptimized: 21974
// shr_large(uint256): 0x00 -> 0x00
// gas Legacy: 21823
// gas LegacyOptimized: 21522
// gas Yul: 22232
// gas YulOptimized: 21744
// shr_large(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0x00
// gas Legacy: 22207
// gas LegacyOptimized: 21906
// gas Yul: 22616
// gas YulOptimized: 22128
// sar_large(uint256): 0x00 -> 0x00
// gas Legacy: 21822
// gas LegacyOptimized: 21522
// gas Yul: 22298
// gas YulOptimized: 21858
// sar_large(uint256): 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0x00
// gas Legacy: 22206
// gas LegacyOptimized: 21906
// gas Yul: 22682
// gas YulOptimized: 22242
// sar_large(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22206
// gas LegacyOptimized: 21906
// gas Yul: 22682
// gas YulOptimized: 22242
// shl_combined(uint256): 0x00 -> 0x00
// gas Legacy: 21838
// gas LegacyOptimized: 21532
// gas Yul: 22314
// gas YulOptimized: 21868
// shl_combined(uint256): 0xffff -> 0xffff0000
// gas Legacy: 21862
// gas LegacyOptimized: 21556
// gas Yul: 22338
// gas YulOptimized: 21892
// shl_combined(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000
// gas Legacy: 22222
// gas LegacyOptimized: 21916
// gas Yul: 22698
// gas YulOptimized: 22252
// shr_combined(uint256): 0x00 -> 0x00
// gas Legacy: 21873
// gas LegacyOptimized: 21567
// gas Yul: 22282
// gas YulOptimized: 21836
// shr_combined(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22257
// gas LegacyOptimized: 21951
// gas Yul: 22666
// gas YulOptimized: 22220
// sar_combined(uint256): 0x00 -> 0x00
// gas Legacy: 21851
// gas LegacyOptimized: 21551
// gas Yul: 22172
// gas YulOptimized: 21732
// sar_combined(uint256): 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22235
// gas LegacyOptimized: 21935
// gas Yul: 22556
// gas YulOptimized: 22116
// sar_combined(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22235
// gas LegacyOptimized: 21935
// gas Yul: 22556
// gas YulOptimized: 22116
// shl_combined_large(uint256): 0x00 -> 0x00
// gas Legacy: 21851
// gas LegacyOptimized: 21544
// gas Yul: 22260
// gas YulOptimized: 21766
// shl_combined_large(uint256): 0xffff -> 0x00
// gas Legacy: 21875
// gas LegacyOptimized: 21568
// gas Yul: 22284
// gas YulOptimized: 21790
// shl_combined_large(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0x00
// gas Legacy: 22235
// gas LegacyOptimized: 21928
// gas Yul: 22644
// gas YulOptimized: 22150
// shl_combined_overflow(uint256): 0x02 -> 0x00
// gas Legacy: 21887
// gas LegacyOptimized: 21577
// gas Yul: 22363
// gas YulOptimized: 21866
// shr_combined_large(uint256): 0x00 -> 0x00
// gas Legacy: 21829
// gas LegacyOptimized: 21522
// gas Yul: 22150
// gas YulOptimized: 21656
// shr_combined_large(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0x00
// gas Legacy: 22213
// gas LegacyOptimized: 21906
// gas Yul: 22534
// gas YulOptimized: 22040
// shr_combined_overflow(uint256): 0x02 -> 0x00
// gas Legacy: 21909
// gas LegacyOptimized: 21599
// gas Yul: 22385
// gas YulOptimized: 21888
// sar_combined_large(uint256): 0x00 -> 0x00
// gas Legacy: 21895
// gas LegacyOptimized: 21595
// gas Yul: 22216
// gas YulOptimized: 21776
// sar_combined_large(uint256): 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0x00
// gas Legacy: 22279
// gas LegacyOptimized: 21979
// gas Yul: 22600
// gas YulOptimized: 22160
// sar_combined_large(uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22279
// gas LegacyOptimized: 21979
// gas Yul: 22600
// gas YulOptimized: 22160
