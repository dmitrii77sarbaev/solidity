contract c {
    uint256[] data;

    function test() public returns (uint256 x, uint256 l) {
        data.push(7);
        data.push(3);
        x = data.length;
        data.pop();
        x = data.length;
        data.pop();
        l = data.length;
    }
}
// ====
// compileViaYul: also
// ----
// test() -> 1, 0
// gas Legacy: 91573
// gas LegacyOptimized: 90397
// gas Yul: 101390
// gas YulOptimized: 97707
