abstract contract A {
    function f() virtual public pure;
}

interface I {
    function f() external pure;
}

contract C {
    function f() pure public {
    }
}

contract Test is C {
    function c() public pure returns (string memory) {
        return type(C).name;
    }
    function a() public pure returns (string memory) {
        return type(A).name;
    }
    function i() public pure returns (string memory) {
        return type(I).name;
    }
}
// ====
// compileViaYul: also
// ----
// c() -> 0x20, 1, "C"
// gas Legacy: 21849
// gas LegacyOptimized: 21604
// gas Yul: 22706
// gas YulOptimized: 21986
// a() -> 0x20, 1, "A"
// gas Legacy: 21805
// gas LegacyOptimized: 21560
// gas Yul: 22662
// gas YulOptimized: 21942
// i() -> 0x20, 1, "I"
// gas Legacy: 21871
// gas LegacyOptimized: 21626
// gas Yul: 22728
// gas YulOptimized: 22008
