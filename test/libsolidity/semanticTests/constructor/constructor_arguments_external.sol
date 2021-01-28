contract Main {
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
// ====
// compileViaYul: also
// ----
// constructor(): "abc", true
// gas Legacy: 166320
// gas LegacyOptimized: 131095
// gas Yul: 242196
// gas YulOptimized: 148076
// getFlag() -> true
// gas Legacy: 22293
// gas LegacyOptimized: 22115
// gas Yul: 22777
// gas YulOptimized: 22280
// getName() -> "abc"
// gas Legacy: 22221
// gas LegacyOptimized: 22103
// gas Yul: 22805
// gas YulOptimized: 22226
