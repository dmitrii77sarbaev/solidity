contract c {
    bytes data;

    function foo() public returns (bool) {
        data.push("f");
        data.push("o");
        data.push("o");
        return keccak256(data) == keccak256("foo");
    }
}

// ====
// compileViaYul: also
// ----
// foo() -> true
// gas Legacy: 54944
// gas LegacyOptimized: 54598
// gas Yul: 49020
// gas YulOptimized: 47764
