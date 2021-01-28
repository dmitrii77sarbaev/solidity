contract C {
    uint x;
    uint y;
    function setX(uint a) public returns (uint _x) {
        x = a;
        _x = x;
    }
    function setY(uint a) public returns (uint _y) {
        y = a;
        _y = y;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// setX(uint256): 6 -> 6
// gas Legacy: 42598
// gas LegacyOptimized: 41493
// gas Yul: 44183
// gas YulOptimized: 41496
// setY(uint256): 2 -> 2
// gas Legacy: 42620
// gas LegacyOptimized: 41515
// gas Yul: 44205
// gas YulOptimized: 41669
