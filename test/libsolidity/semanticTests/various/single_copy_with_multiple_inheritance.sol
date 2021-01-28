contract Base {
    uint256 data;

    function setData(uint256 i) public {
        data = i;
    }

    function getViaBase() public returns (uint256 i) {
        return data;
    }
}


contract A is Base {
    function setViaA(uint256 i) public {
        setData(i);
    }
}


contract B is Base {
    function getViaB() public returns (uint256 i) {
        return getViaBase();
    }
}


contract Derived is Base, B, A {}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// getViaB() -> 0
// gas Legacy: 22280
// gas LegacyOptimized: 22171
// gas Yul: 22889
// gas YulOptimized: 22306
// setViaA(uint256): 23 ->
// gas Legacy: 41675
// gas LegacyOptimized: 41479
// gas Yul: 43109
// gas YulOptimized: 41595
// getViaB() -> 23
// gas Legacy: 22280
// gas LegacyOptimized: 22171
// gas Yul: 22889
// gas YulOptimized: 22306
