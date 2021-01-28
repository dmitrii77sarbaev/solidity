contract C {
    function f() public returns(uint) {
        return 2e10 wei;
    }

    function g() public returns(uint) {
        return 200e-2 wei;
    }

    function h() public returns(uint) {
        return 2.5e1;
    }

    function i() public returns(int) {
        return -2e10;
    }

    function j() public returns(int) {
        return -200e-2;
    }

    function k() public returns(int) {
        return -2.5e1;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 20000000000
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21849
// gas YulOptimized: 21440
// g() -> 2
// gas Legacy: 21467
// gas LegacyOptimized: 21358
// gas Yul: 21937
// gas YulOptimized: 21528
// h() -> 25
// gas Legacy: 21445
// gas LegacyOptimized: 21336
// gas Yul: 21915
// gas YulOptimized: 21506
// i() -> -20000000000
// gas Legacy: 21489
// gas LegacyOptimized: 21383
// gas Yul: 21962
// gas YulOptimized: 21553
// j() -> -2
// gas Legacy: 21423
// gas LegacyOptimized: 21317
// gas Yul: 21896
// gas YulOptimized: 21487
// k() -> -25
// gas Legacy: 21401
// gas LegacyOptimized: 21295
// gas Yul: 21874
// gas YulOptimized: 21465
