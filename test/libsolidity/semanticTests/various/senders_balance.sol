contract C {
    function f() public view returns (uint256) {
        return msg.sender.balance;
    }
}


contract D {
    C c = new C();

    constructor() payable {}

    function f() public view returns (uint256) {
        return c.f();
    }
}

// ====
// compileViaYul: also
// ----
// constructor(), 27 wei ->
// gas Legacy: 264062
// gas LegacyOptimized: 219073
// gas Yul: 351785
// gas YulOptimized: 190266
// f() -> 27
// gas Legacy: 25057
// gas LegacyOptimized: 24703
// gas Yul: 26374
// gas YulOptimized: 24789
