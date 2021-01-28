contract C {
    function shl(uint256 a, uint256 b) public returns (uint256 c) {
        assembly {
            c := shl(b, a)
        }
    }

    function shr(uint256 a, uint256 b) public returns (uint256 c) {
        assembly {
            c := shr(b, a)
        }
    }

    function sar(uint256 a, uint256 b) public returns (uint256 c) {
        assembly {
            c := sar(b, a)
        }
    }
}
// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// shl(uint256,uint256): 0x01, 0x02 -> 0x04
// gas Legacy: 22125
// gas LegacyOptimized: 21672
// gas Yul: 22435
// gas YulOptimized: 21788
// shl(uint256,uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x01 -> 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe
// gas Legacy: 22497
// gas LegacyOptimized: 22044
// gas Yul: 22807
// gas YulOptimized: 22160
// shl(uint256,uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x100 -> 0x00
// gas Legacy: 22497
// gas LegacyOptimized: 22044
// gas Yul: 22807
// gas YulOptimized: 22160
// shr(uint256,uint256): 0x03, 0x01 -> 0x01
// gas Legacy: 22103
// gas LegacyOptimized: 21650
// gas Yul: 22413
// gas YulOptimized: 21766
// shr(uint256,uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x01 -> 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22475
// gas LegacyOptimized: 22022
// gas Yul: 22785
// gas YulOptimized: 22138
// shr(uint256,uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xff -> 0x01
// gas Legacy: 22475
// gas LegacyOptimized: 22022
// gas Yul: 22785
// gas YulOptimized: 22138
// shr(uint256,uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x100 -> 0x00
// gas Legacy: 22475
// gas LegacyOptimized: 22022
// gas Yul: 22785
// gas YulOptimized: 22138
// sar(uint256,uint256): 0x03, 0x01 -> 0x01
// gas Legacy: 22147
// gas LegacyOptimized: 21694
// gas Yul: 22457
// gas YulOptimized: 21810
// sar(uint256,uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x01 -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22519
// gas LegacyOptimized: 22066
// gas Yul: 22829
// gas YulOptimized: 22182
// sar(uint256,uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0xff -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22519
// gas LegacyOptimized: 22066
// gas Yul: 22829
// gas YulOptimized: 22182
// sar(uint256,uint256): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, 0x100 -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// gas Legacy: 22519
// gas LegacyOptimized: 22066
// gas Yul: 22829
// gas YulOptimized: 22182
