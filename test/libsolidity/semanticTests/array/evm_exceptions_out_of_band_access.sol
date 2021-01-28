contract A {
    uint256[3] arr;
    bool public test = false;

    function getElement(uint256 i) public returns (uint256) {
        return arr[i];
    }

    function testIt() public returns (bool) {
        uint256 i = this.getElement(5);
        test = true;
        return true;
    }
}
// ====
// compileViaYul: also
// ----
// test() -> false
// gas Legacy: 22257
// gas LegacyOptimized: 22126
// gas Yul: 22778
// gas YulOptimized: 22331
// testIt() -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 23382
// gas LegacyOptimized: 23061
// gas Yul: 23919
// gas YulOptimized: 23066
// test() -> false
// gas Legacy: 22257
// gas LegacyOptimized: 22126
// gas Yul: 22778
// gas YulOptimized: 22331
