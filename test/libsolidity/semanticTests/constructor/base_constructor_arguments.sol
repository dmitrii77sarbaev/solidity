contract BaseBase {
    uint256 m_a;

    constructor(uint256 a) {
        m_a = a;
    }
}


contract Base is BaseBase(7) {
    constructor() {
        m_a *= m_a;
    }
}


contract Derived is Base {
    function getA() public returns (uint256 r) {
        return m_a;
    }
}

// ====
// compileViaYul: also
// ----
// getA() -> 49
// gas Legacy: 22167
// gas LegacyOptimized: 22058
// gas Yul: 22730
// gas YulOptimized: 22022
