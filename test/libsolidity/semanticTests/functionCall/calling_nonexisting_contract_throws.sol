abstract contract D {
    function g() public virtual;
}


contract C {
    D d = D(address(0x1212));

    function f() public returns (uint256) {
        d.g();
        return 7;
    }

    function g() public returns (uint256) {
        d.g{gas: 200}();
        return 7;
    }

    function h() public returns (uint256) {
        address(d).call(""); // this does not throw (low-level)
        return 7;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE
// gas Legacy: 22825
// gas LegacyOptimized: 22849
// gas Yul: 23216
// gas YulOptimized: 22799
// g() -> FAILURE
// gas Legacy: 22872
// gas LegacyOptimized: 22896
// gas Yul: 23351
// gas YulOptimized: 22843
// h() -> 7
// gas Legacy: 23219
// gas LegacyOptimized: 22945
// gas Yul: 24062
// gas YulOptimized: 23109
