contract Base {
    uint256 dataBase;

    function getViaBase() public returns (uint256 i) {
        return dataBase;
    }
}


contract Derived is Base {
    uint256 dataDerived;

    function setData(uint256 base, uint256 derived) public returns (bool r) {
        dataBase = base;
        dataDerived = derived;
        return true;
    }

    function getViaDerived() public returns (uint256 base, uint256 derived) {
        base = dataBase;
        derived = dataDerived;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// setData(uint256,uint256): 1, 2 -> true
// gas Legacy: 62175
// gas LegacyOptimized: 61718
// gas Yul: 64691
// gas YulOptimized: 61881
// getViaBase() -> 1
// gas Legacy: 22179
// gas LegacyOptimized: 22070
// gas Yul: 22743
// gas YulOptimized: 22240
// getViaDerived() -> 1, 2
// gas Legacy: 23115
// gas LegacyOptimized: 22916
// gas Yul: 23871
// gas YulOptimized: 23135
