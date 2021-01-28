contract Helper {
    bytes3 name;
    bool flag;

    constructor(bytes3 x, bool f) payable {
        name = x;
        flag = f;
    }

    function getName() public returns (bytes3 ret) {
        return name;
    }

    function getFlag() public returns (bool ret) {
        return flag;
    }
}


contract Main {
    Helper h;

    constructor() payable {
        h = (new Helper){value: 10}("abc", true);
    }

    function getFlag() public returns (bool ret) {
        return h.getFlag();
    }

    function getName() public returns (bytes3 ret) {
        return h.getName();
    }

    function getBalances() public returns (uint256 me, uint256 them) {
        me = address(this).balance;
        them = address(h).balance;
    }
}

// ====
// compileViaYul: also
// ----
// constructor(), 22 wei ->
// gas Legacy: 445417
// gas LegacyOptimized: 327348
// gas Yul: 601985
// gas YulOptimized: 357196
// getFlag() -> true
// gas Legacy: 25325
// gas LegacyOptimized: 24924
// gas Yul: 26752
// gas YulOptimized: 25317
// getName() -> "abc"
// gas Legacy: 25231
// gas LegacyOptimized: 24938
// gas Yul: 26770
// gas YulOptimized: 25253
// getBalances() -> 12, 10
// gas Legacy: 23022
// gas LegacyOptimized: 22808
// gas Yul: 24572
// gas YulOptimized: 23056
