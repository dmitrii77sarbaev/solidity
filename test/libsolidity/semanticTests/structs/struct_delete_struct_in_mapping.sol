contract test {
    struct testStruct {
        uint256 m_value;
    }
    mapping(uint256 => testStruct) campaigns;

    constructor() {
        campaigns[0].m_value = 2;
    }

    function deleteIt() public returns (uint256) {
        delete campaigns[0];
        return campaigns[0].m_value;
    }
}

// ====
// compileViaYul: also
// ----
// deleteIt() -> 0
// gas Legacy: 23166
// gas LegacyOptimized: 22100
// gas Yul: 25319
// gas YulOptimized: 22966
