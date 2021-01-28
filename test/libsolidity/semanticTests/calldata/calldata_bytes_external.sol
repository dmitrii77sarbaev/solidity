contract CalldataTest {
    function test(bytes calldata x) public returns (bytes calldata) {
        return x;
    }
    function tester(bytes calldata x) public returns (bytes1) {
        return this.test(x)[2];
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// tester(bytes): 0x20, 0x08, "abcdefgh" -> "c"
// gas Legacy: 26020
// gas LegacyOptimized: 25001
// gas Yul: 27316
// gas YulOptimized: 25374
