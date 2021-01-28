contract Test {
    bytes x;
    function set(bytes memory _a) public { x = _a; }
}
// ====
// compileViaYul: also
// ----
// set(bytes): 0x20, 3, "abc"
// gas Legacy: 43661
// gas LegacyOptimized: 43241
// gas Yul: 44215
// gas YulOptimized: 43359
// storage: nonempty// set(bytes): 0x20, 0
// gas Legacy: 25089
// gas LegacyOptimized: 24661
// gas Yul: 24816
// gas YulOptimized: 23960
// storage: empty// set(bytes): 0x20, 31, "1234567890123456789012345678901"
// gas Legacy: 24797
// gas LegacyOptimized: 24377
// gas Yul: 25351
// gas YulOptimized: 24495
// storage: nonempty// set(bytes): 0x20, 36, "12345678901234567890123456789012", "XXXX"
// gas Legacy: 65164
// gas LegacyOptimized: 64743
// gas Yul: 65742
// gas YulOptimized: 64935
// storage: nonempty// set(bytes): 0x20, 3, "abc"
// gas Legacy: 26161
// gas LegacyOptimized: 25725
// gas Yul: 29496
// gas YulOptimized: 26102
// storage: nonempty// set(bytes): 0x20, 0
// gas Legacy: 25089
// gas LegacyOptimized: 24661
// gas Yul: 24816
// gas YulOptimized: 23960
// storage: empty// set(bytes): 0x20, 3, "abc"
// gas Legacy: 24461
// gas LegacyOptimized: 24041
// gas Yul: 25015
// gas YulOptimized: 24159
// storage: nonempty// set(bytes): 0x20, 36, "12345678901234567890123456789012", "XXXX"
// gas Legacy: 26764
// gas LegacyOptimized: 26343
// gas Yul: 27342
// gas YulOptimized: 26535
// storage: nonempty// set(bytes): 0x20, 0
// gas Legacy: 25932
// gas LegacyOptimized: 25496
// gas Yul: 29297
// gas YulOptimized: 25903
// storage: empty// set(bytes): 0x20, 66, "12345678901234567890123456789012", "12345678901234567890123456789012", "12"
// gas Legacy: 47328
// gas LegacyOptimized: 46907
// gas Yul: 47931
// gas YulOptimized: 47124
// storage: nonempty// set(bytes): 0x20, 3, "abc"
// gas Legacy: 27018
// gas LegacyOptimized: 26574
// gas Yul: 31619
// gas YulOptimized: 26960
// storage: nonempty// set(bytes): 0x20, 0
// gas Legacy: 25089
// gas LegacyOptimized: 24661
// gas Yul: 24816
// gas YulOptimized: 23960
// storage: empty