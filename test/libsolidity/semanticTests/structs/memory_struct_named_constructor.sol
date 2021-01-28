pragma abicoder               v2;

contract C {
    struct S {
        uint256 a;
        bool x;
    }

    function s() public returns(S memory)
    {
        return S({x: true, a: 8});
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// s() -> 8, true
// gas Legacy: 21704
// gas LegacyOptimized: 21458
// gas Yul: 22932
// gas YulOptimized: 21684
