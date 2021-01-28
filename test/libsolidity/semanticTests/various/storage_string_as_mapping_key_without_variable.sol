contract Test {
    mapping(string => uint256) data;

    function f() public returns (uint256) {
        data["abc"] = 2;
        return data["abc"];
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 42764
// gas LegacyOptimized: 42359
// gas Yul: 45026
// gas YulOptimized: 42376
