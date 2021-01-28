contract Creator {
    uint256 public r;
    address public ch;

    constructor(address[3] memory s, uint256 x) {
        r = x;
        ch = s[2];
    }
}
// ====
// compileViaYul: also
// ----
// constructor(): 1, 2, 3, 4 ->
// gas Legacy: 193490
// gas LegacyOptimized: 152312
// gas Yul: 262732
// gas YulOptimized: 169280
// r() -> 4
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22208
// ch() -> 3
// gas Legacy: 22278
// gas LegacyOptimized: 22134
// gas Yul: 22824
// gas YulOptimized: 22298
