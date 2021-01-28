contract C {
    uint256 public x;

    function f(uint256 y) public payable {
        x = y;
    }

    function g(uint256 y) external {
        x = y;
    }

    function h() public {
        this.g(12);
    }
}


contract D {
    C c = new C();

    function f() public payable returns (uint256) {
        c.g(3);
        return c.x();
    }

    function g() public returns (uint256) {
        c.g(8);
        return c.x();
    }

    function h() public returns (uint256) {
        c.h();
        return c.x();
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 3
// gas Legacy: 48145
// gas LegacyOptimized: 47447
// gas Yul: 51690
// gas YulOptimized: 48501
// g() -> 8
// gas Legacy: 29013
// gas LegacyOptimized: 28315
// gas Yul: 32553
// gas YulOptimized: 29364
// h() -> 12
// gas Legacy: 30698
// gas LegacyOptimized: 30036
// gas Yul: 35148
// gas YulOptimized: 31376
