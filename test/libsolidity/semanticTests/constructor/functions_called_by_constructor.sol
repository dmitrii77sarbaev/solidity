contract Test {
    bytes3 name;
    bool flag;

    constructor() {
        setName("abc");
    }

    function getName() public returns (bytes3 ret) {
        return name;
    }

    function setName(bytes3 _name) private {
        name = _name;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// getName() -> "abc"
// gas Legacy: 22221
// gas LegacyOptimized: 22103
// gas Yul: 22804
// gas YulOptimized: 22052
