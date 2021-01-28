pragma abicoder               v2;

contract C {
    struct S {
        uint a;
        uint b;
    }
    struct T {
        uint a;
        uint b;
        string s;
    }
    function s() public returns (S memory) {
        return S(23, 42);
    }
    function t() public returns (T memory) {
        return T(23, 42, "any");
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// s() -> 23, 42
// gas Legacy: 21686
// gas LegacyOptimized: 21451
// gas Yul: 23009
// gas YulOptimized: 21743
// t() -> 0x20, 23, 42, 0x60, 3, "any"
// gas Legacy: 22319
// gas LegacyOptimized: 21838
// gas Yul: 24245
// gas YulOptimized: 22304
