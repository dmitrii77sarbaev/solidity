contract c {
    bytes data;
    function direct(bytes calldata arg, uint index) external returns (uint) {
        return uint(uint8(arg[index]));
    }
    function storageCopyRead(bytes calldata arg, uint index) external returns (uint) {
        data = arg;
        return uint(uint8(data[index]));
    }
    function storageWrite() external returns (uint) {
        data = new bytes(35);
        data[31] = 0x77;
        data[32] = 0x14;

        data[31] = 0x01;
        data[31] |= 0x08;
        data[30] = 0x01;
        data[32] = 0x03;
        return uint(uint8(data[30])) * 0x100 | uint(uint8(data[31])) * 0x10 | uint(uint8(data[32]));
    }
}
// ====
// compileViaYul: also
// ----
// direct(bytes,uint256): 0x40, 33, 34, 0x000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F, left(0x2021) -> 0x21
// gas Legacy: 23040
// gas LegacyOptimized: 22700
// gas Yul: 23008
// gas YulOptimized: 23008
// storageCopyRead(bytes,uint256): 0x40, 33, 34, 0x000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F, left(0x2021) -> 0x21
// gas Legacy: 87026
// gas LegacyOptimized: 86663
// gas Yul: 86309
// gas YulOptimized: 86309
// storageWrite() -> 0x193
// gas Legacy: 56012
// gas LegacyOptimized: 54734
// gas Yul: 50449
// gas YulOptimized: 50449
