contract C {
    function f() external returns (bytes4) {
        return this.f.selector;
    }
    function h(function() external a) public returns (bytes4) {
        return a.selector;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> left(0x26121ff0)
// gas Legacy: 21391
// gas LegacyOptimized: 21303
// gas Yul: 21917
// gas YulOptimized: 21423
// h(function): left(0x1122334400112233445566778899AABBCCDDEEFF42424242) -> left(0x42424242)
// gas Legacy: 22377
// gas LegacyOptimized: 21885
// gas Yul: 22827
// gas YulOptimized: 21993
