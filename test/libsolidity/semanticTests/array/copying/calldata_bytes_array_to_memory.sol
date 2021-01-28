pragma abicoder               v2;


contract C {
    function f(bytes[] calldata a)
        external
        returns (uint256, uint256, bytes memory)
    {
        bytes memory m = a[0];
        return (a.length, m.length, m);
    }
}
// ====
// compileViaYul: also
// ----
// f(bytes[]): 0x20, 0x1, 0x20, 0x2, hex"6162000000000000000000000000000000000000000000000000000000000000" -> 0x1, 0x2, 0x60, 0x2, hex"6162000000000000000000000000000000000000000000000000000000000000"
// gas Legacy: 23477
// gas LegacyOptimized: 22942
// gas Yul: 24520
// gas YulOptimized: 23052
// f(bytes[]): 0x20, 0x1, 0x20, 0x20, hex"7878787878787878787878787878787878787878787878787878787878787878" -> 0x1, 0x20, 0x60, 0x20, hex"7878787878787878787878787878787878787878787878787878787878787878"
// gas Legacy: 23819
// gas LegacyOptimized: 23278
// gas Yul: 24862
// gas YulOptimized: 23388
// f(bytes[]): 0x20, 0x1, 0x20, 0x20, hex"7800000000000000000000000000000000000000000000000000000000000061" -> 0x1, 0x20, 0x60, 0x20, hex"7800000000000000000000000000000000000000000000000000000000000061"
// gas Legacy: 23459
// gas LegacyOptimized: 22918
// gas Yul: 24502
// gas YulOptimized: 23028
// f(bytes[]): 0x20, 0x1, 0x20, 0x20, hex"6100000000000000000000000000000000000000000000000000000000000078" -> 0x1, 0x20, 0x60, 0x20, hex"6100000000000000000000000000000000000000000000000000000000000078"
// gas Legacy: 23459
// gas LegacyOptimized: 22918
// gas Yul: 24502
// gas YulOptimized: 23028
// f(bytes[]): 0x20, 0x1, 0x20, 0x20, hex"616d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d78" -> 0x1, 0x20, 0x60, 0x20, hex"616d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d78"
// gas Legacy: 23819
// gas LegacyOptimized: 23278
// gas Yul: 24862
// gas YulOptimized: 23388
