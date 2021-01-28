contract C {
    function balance() public returns (uint256) {
        return 1;
    }

    function transfer(uint256 amount) public returns (uint256) {
        return amount;
    }
}


contract D {
    function f() public returns (uint256) {
        return (new C()).balance();
    }

    function g() public returns (uint256) {
        return (new C()).transfer(5);
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 133448
// gas LegacyOptimized: 101628
// gas Yul: 172056
// gas YulOptimized: 111246
// g() -> 5
// gas Legacy: 133908
// gas LegacyOptimized: 101753
// gas Yul: 172294
// gas YulOptimized: 111379
