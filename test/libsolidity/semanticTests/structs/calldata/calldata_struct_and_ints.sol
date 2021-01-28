pragma abicoder               v2;


contract C {
    struct S {
        uint256 a;
        uint256 b;
    }

    function f(uint256 a, S calldata s, uint256 b)
        external
        pure
        returns (uint256, uint256, uint256, uint256)
    {
        return (a, s.a, s.b, b);
    }
}

// ====
// compileViaYul: also
// ----
// f(uint256,(uint256,uint256),uint256): 1, 2, 3, 4 -> 1, 2, 3, 4
// gas Legacy: 22838
// gas LegacyOptimized: 22086
// gas Yul: 23490
// gas YulOptimized: 22079
