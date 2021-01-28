contract test {
    function boo() public returns (bytes4 value) {
        return msg.sig;
    }

    function foo(uint256 a) public returns (bytes4 value) {
        return boo();
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// foo(uint256): 0x0 -> 0x2fbebd3800000000000000000000000000000000000000000000000000000000
// gas Legacy: 21822
// gas LegacyOptimized: 21563
// gas Yul: 22179
// gas YulOptimized: 21560
