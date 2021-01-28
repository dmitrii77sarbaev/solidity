contract C {
    mapping(uint => uint) simple;
    mapping(uint16 => uint) cleanup;
    mapping(string => uint) str;
    mapping(uint => mapping(uint => uint)) twodim;
    function test_simple(uint _off) public returns (uint _a, uint _b, uint _c) {
        simple[_off + 2] = 3;
        simple[_off + 3] = 4;
        simple[type(uint256).max] = 5;
        _c = simple[type(uint256).max];
        _b = simple[3 + _off];
        _a = simple[2 + _off];
    }
    function test_cleanup() public returns (bool) {
        uint16 x;
        assembly { x := 0xffff0001 }
        cleanup[x] = 3;
        return cleanup[1] == 3;
    }
    function test_str() public returns (bool) {
        str["abc"] = 3;
        string memory s = "abc";
        return str[s] == 3;
    }
    function test_twodim() public returns (uint a, uint b) {
        twodim[2][3] = 3;
        a = twodim[3][2];
        b = twodim[2][3];
    }
}
// ====
// compileViaYul: also
// ----
// test_simple(uint256): 0 -> 3, 4, 5
// gas Legacy: 85730
// gas LegacyOptimized: 83868
// gas Yul: 91259
// gas YulOptimized: 84897
// test_simple(uint256): 1 -> 3, 4, 5
// gas Legacy: 47342
// gas LegacyOptimized: 45480
// gas Yul: 52871
// gas YulOptimized: 46509
// test_simple(uint256): 2 -> 3, 4, 5
// gas Legacy: 47342
// gas LegacyOptimized: 45480
// gas Yul: 52871
// gas YulOptimized: 46509
// test_cleanup() -> true
// gas Legacy: 42414
// gas LegacyOptimized: 41328
// gas Yul: 44588
// gas YulOptimized: 42442
// test_str() -> true
// gas Legacy: 43055
// gas LegacyOptimized: 42602
// gas Yul: 45958
// gas YulOptimized: 42796
// test_twodim() -> 0, 3
// gas Legacy: 43641
// gas LegacyOptimized: 42187
// gas Yul: 46320
// gas YulOptimized: 43593
