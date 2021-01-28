contract test {
    bool public flag = false;

    function f0() public {
        flag = true;
    }

    function f() public returns (bool) {
        function() internal x = f0;
        x();
        return flag;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 43128
// gas LegacyOptimized: 42946
// gas Yul: 43954
// gas YulOptimized: 43134
// flag() -> true
// gas Legacy: 22232
// gas LegacyOptimized: 22104
// gas Yul: 22756
// gas YulOptimized: 22274
