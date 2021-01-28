contract Base {
    constructor(uint256 i) {
        m_i = i;
    }

    uint256 public m_i;
}


contract Derived is Base {
    constructor(uint256 i) Base(i) {}
}


contract Final is Derived(4) {}

// ====
// compileViaYul: also
// ----
// m_i() -> 4
// gas Legacy: 22159
// gas LegacyOptimized: 22058
// gas Yul: 22709
// gas YulOptimized: 22022
