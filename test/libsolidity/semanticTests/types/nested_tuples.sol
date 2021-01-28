contract test {
    function f0() public returns(int, bool) {
        int a;
        bool b;
        ((a, b)) = (2, true);
        return (a, b);
    }
    function f1() public returns(int) {
        int a;
        (((a, ), )) = ((1, 2) ,3);
        return a;
    }
    function f2() public returns(int) {
        int a;
        (((, a),)) = ((1, 2), 3);
        return a;
    }
    function f3() public returns(int) {
        int a = 3;
        ((, ), ) = ((7, 8), 9);
        return a;
    }
    function f4() public returns(int) {
        int a;
        (a, ) = (4, (8, 16, 32));
        return a;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f0() -> 2, true
// gas Legacy: 21557
// gas LegacyOptimized: 21322
// gas Yul: 22243
// gas YulOptimized: 21544
// f1() -> 1
// gas Legacy: 21492
// gas LegacyOptimized: 21336
// gas Yul: 22039
// gas YulOptimized: 21506
// f2() -> 2
// gas Legacy: 21434
// gas LegacyOptimized: 21270
// gas Yul: 21973
// gas YulOptimized: 21440
// f3() -> 3
// gas Legacy: 21470
// gas LegacyOptimized: 21314
// gas Yul: 21893
// gas YulOptimized: 21484
// f4() -> 4
// gas Legacy: 21485
// gas LegacyOptimized: 21358
// gas Yul: 22017
// gas YulOptimized: 21528
