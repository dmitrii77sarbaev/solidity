contract C {
    function short_dyn() public pure returns (string memory x) {
        x = "abc";
    }
    function long_dyn() public pure returns (string memory x) {
        x = "12345678901234567890123456789012345678901234567890123456789012345678901234567890";
    }
    function short_bytes_dyn() public pure returns (bytes memory x) {
        x = "abc";
    }
    function long_bytes_dyn() public pure returns (bytes memory x) {
        x = "12345678901234567890123456789012345678901234567890123456789012345678901234567890";
    }
    function bytesNN() public pure returns (bytes3 x) {
        x = "abc";
    }
    function bytesNN_padded() public pure returns (bytes4 x) {
        x = "abc";
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// short_dyn() -> 0x20, 3, "abc"
// gas Legacy: 21827
// gas LegacyOptimized: 21622
// gas Yul: 22720
// gas YulOptimized: 21967
// long_dyn() -> 0x20, 80, "12345678901234567890123456789012", "34567890123456789012345678901234", "5678901234567890"
// gas Legacy: 22043
// gas LegacyOptimized: 21847
// gas Yul: 22958
// gas YulOptimized: 22229
// short_bytes_dyn() -> 0x20, 3, "abc"
// gas Legacy: 21849
// gas LegacyOptimized: 21644
// gas Yul: 22742
// gas YulOptimized: 21989
// long_bytes_dyn() -> 0x20, 80, "12345678901234567890123456789012", "34567890123456789012345678901234", "5678901234567890"
// gas Legacy: 22087
// gas LegacyOptimized: 21891
// gas Yul: 23002
// gas YulOptimized: 22273
// bytesNN() -> 0x6162630000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21385
// gas LegacyOptimized: 21303
// gas Yul: 21815
// gas YulOptimized: 21458
// bytesNN_padded() -> 0x6162630000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21473
// gas LegacyOptimized: 21391
// gas Yul: 21903
// gas YulOptimized: 21546
