contract A {
    function f(uint256 a) public returns (uint256) {
        return 2 * a;
    }
}


contract B {
    function f(bool b) public returns (uint256) {
        return 10;
    }
}


contract C is A, B {
    function g() public returns (uint256) {
        return super.f(true);
    }

    function h() public returns (uint256) {
        return super.f(1);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 10
// gas Legacy: 21488
// gas LegacyOptimized: 21376
// gas Yul: 22003
// gas YulOptimized: 21503
// h() -> 2
// gas Legacy: 21676
// gas LegacyOptimized: 21451
// gas Yul: 22279
// gas YulOptimized: 21580
