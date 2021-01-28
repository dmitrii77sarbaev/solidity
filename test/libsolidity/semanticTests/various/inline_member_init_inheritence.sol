contract Base {
    constructor() {}

    uint256 m_base = 5;

    function getBMember() public returns (uint256 i) {
        return m_base;
    }
}


contract Derived is Base {
    constructor() {}

    uint256 m_derived = 6;

    function getDMember() public returns (uint256 i) {
        return m_derived;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// getBMember() -> 5
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22743
// gas YulOptimized: 22208
// getDMember() -> 6
// gas Legacy: 22201
// gas LegacyOptimized: 22092
// gas Yul: 22765
// gas YulOptimized: 22262
