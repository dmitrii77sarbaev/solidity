// This tests that the compiler knows the correct size of the function on the stack.
contract c {
    uint256[] data;

    function test() public returns (uint256 x) {
        x = 2;
        data.pop;
        x = 3;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() -> 3
// gas Legacy: 21387
// gas LegacyOptimized: 21270
// gas Yul: 21944
// gas YulOptimized: 21229
