contract C {
    function f() public returns(bytes32) {
        return blockhash(1);
    }
    function g() public returns(bytes32) {
        return blockhash(2);
    }
    function h() public returns(bytes32) {
        return blockhash(3);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x3737373737373737373737373737373737373737373737373737373737373738
// gas Legacy: 21399
// gas LegacyOptimized: 21290
// gas Yul: 21869
// gas YulOptimized: 21457
// g() -> 0x3737373737373737373737373737373737373737373737373737373737373739
// gas Legacy: 21443
// gas LegacyOptimized: 21334
// gas Yul: 21913
// gas YulOptimized: 21501
// h() -> 0x373737373737373737373737373737373737373737373737373737373737373a
// gas Legacy: 21421
// gas LegacyOptimized: 21312
// gas Yul: 21891
// gas YulOptimized: 21479
