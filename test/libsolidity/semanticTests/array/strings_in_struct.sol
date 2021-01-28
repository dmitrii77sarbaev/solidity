contract buggystruct {
    Buggy public bug;

    struct Buggy {
        uint256 first;
        uint256 second;
        uint256 third;
        string last;
    }

    constructor() {
        bug = Buggy(10, 20, 30, "asdfghjkl");
    }

    function getFirst() public returns (uint256) {
        return bug.first;
    }

    function getSecond() public returns (uint256) {
        return bug.second;
    }

    function getThird() public returns (uint256) {
        return bug.third;
    }

    function getLast() public returns (string memory) {
        return bug.last;
    }
}
// ====
// compileViaYul: also
// ----
// getFirst() -> 0x0a
// gas Legacy: 22229
// gas LegacyOptimized: 22114
// gas Yul: 22793
// gas YulOptimized: 22322
// getSecond() -> 0x14
// gas Legacy: 22185
// gas LegacyOptimized: 22070
// gas Yul: 22749
// gas YulOptimized: 22278
// getThird() -> 0x1e
// gas Legacy: 22207
// gas LegacyOptimized: 22092
// gas Yul: 22771
// gas YulOptimized: 22300
// getLast() -> 0x20, 0x09, "asdfghjkl"
// gas Legacy: 24699
// gas LegacyOptimized: 24479
// gas Yul: 23705
// gas YulOptimized: 23069
