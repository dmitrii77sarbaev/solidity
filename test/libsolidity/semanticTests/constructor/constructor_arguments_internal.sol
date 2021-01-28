contract Helper {
    bytes3 name;
    bool flag;

    constructor(bytes3 x, bool f) {
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

    constructor() {
        h = new Helper("abc", true);
    }

    function getFlag() public returns (bool ret) {
        return h.getFlag();
    }

    function getName() public returns (bytes3 ret) {
        return h.getName();
    }
}

// ====
// compileViaYul: also
// ----
// getFlag() -> true
// gas Legacy: 25303
// gas LegacyOptimized: 24902
// gas Yul: 26730
// gas YulOptimized: 25298
// getName() -> "abc"
// gas Legacy: 25209
// gas LegacyOptimized: 24916
// gas Yul: 26748
// gas YulOptimized: 25144
