contract A {
    uint public data;
    uint public balance;
    bytes public externalData;
    fallback() external payable {
        data += 1;
        balance = msg.value;
        externalData = msg.data;
    }
}
// ====
// compileViaYul: also
// ----
// data() -> 0
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22297
// ()
// gas Legacy: 44846
// gas LegacyOptimized: 44685
// gas Yul: 47629
// gas YulOptimized: 44689
// data() -> 1
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22297
// (): hex"42ef"
// gas Legacy: 44925
// gas LegacyOptimized: 44764
// gas Yul: 47678
// gas YulOptimized: 44732
// data() -> 2
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22297
// externalData() -> 0x20, 2, left(0x42ef)
// gas Legacy: 24597
// gas LegacyOptimized: 24337
// gas Yul: 23598
// gas YulOptimized: 22948
// balance() -> 0
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22319
// (), 1 wei
// gas Legacy: 45703
// gas LegacyOptimized: 45534
// gas Yul: 47629
// gas YulOptimized: 44689
// balance() -> 1
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22319
// (), 2 wei: hex"fefe"
// gas Legacy: 25725
// gas LegacyOptimized: 25564
// gas Yul: 28478
// gas YulOptimized: 25532
// balance() -> 2
// gas Legacy: 22215
// gas LegacyOptimized: 22114
// gas Yul: 22766
// gas YulOptimized: 22319
// externalData() -> 0x20, 2, left(0xfefe)
// gas Legacy: 24597
// gas LegacyOptimized: 24337
// gas Yul: 23598
// gas YulOptimized: 22948
