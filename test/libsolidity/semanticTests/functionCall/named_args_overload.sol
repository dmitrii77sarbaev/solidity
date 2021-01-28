contract C {
    function f() public returns (uint) {
        return 0;
    }
    function f(uint a) public returns (uint) {
        return a;
    }
    function f(uint a, uint b) public returns (uint) {
        return a+b;
    }
    function f(uint a, uint b, uint c) public returns (uint) {
        return a+b+c;
    }
    function call(uint num) public returns (uint256) {
        if (num == 0)
            return f();
        if (num == 1)
            return f({a: 1});
        if (num == 2)
            return f({b: 1, a: 2});
        if (num == 3)
            return f({c: 1, a: 2, b: 3});
        if (num == 4)
            return f({b: 5, c: 1, a: 2});

        return 500;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// call(uint256): 0 -> 0
// gas Legacy: 21880
// gas LegacyOptimized: 21587
// gas Yul: 22452
// gas YulOptimized: 21709
// call(uint256): 1 -> 1
// gas Legacy: 21934
// gas LegacyOptimized: 21625
// gas Yul: 22630
// gas YulOptimized: 21747
// call(uint256): 2 -> 3
// gas Legacy: 22159
// gas LegacyOptimized: 21736
// gas Yul: 23080
// gas YulOptimized: 21857
// call(uint256): 3 -> 6
// gas Legacy: 22384
// gas LegacyOptimized: 21840
// gas Yul: 23530
// gas YulOptimized: 21967
// call(uint256): 4 -> 8
// gas Legacy: 22410
// gas LegacyOptimized: 21866
// gas Yul: 23688
// gas YulOptimized: 21993
// call(uint256): 5 -> 500
// gas Legacy: 21959
// gas LegacyOptimized: 21663
// gas Yul: 23006
// gas YulOptimized: 21815
