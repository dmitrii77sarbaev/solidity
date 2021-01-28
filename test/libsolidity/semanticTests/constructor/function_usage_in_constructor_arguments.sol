contract BaseBase {
    uint256 m_a;

    constructor(uint256 a) {
        m_a = a;
    }

    function g() public returns (uint256 r) {
        return 2;
    }
}


contract Base is BaseBase(BaseBase.g()) {}


contract Derived is Base {
    function getA() public returns (uint256 r) {
        return m_a;
    }
}

// ====
// compileViaYul: also
// ----
// getA() -> 2
// gas Legacy: 22167
// gas LegacyOptimized: 22058
// gas Yul: 22731
// gas YulOptimized: 22135
