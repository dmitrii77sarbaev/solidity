// Tests that virtual lookup for modifiers in libraries does not consider
// the current inheritance hierarchy.
library L {
    struct S {
        uint256 v;
    }
    modifier mod(S storage s) {
        s.v++;
        _;
    }

    function libFun(S storage s) internal mod(s) {
        s.v += 0x100;
    }
}


contract Test {
    using L for *;
    L.S s;
    modifier mod(L.S storage) {
        revert();
        _;
    }

    function f() public returns (uint256) {
        s.libFun();
        L.libFun(s);
        return s.v;
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 0x202
// gas Legacy: 48639
// gas LegacyOptimized: 48129
// gas Yul: 54708
// gas YulOptimized: 44804
