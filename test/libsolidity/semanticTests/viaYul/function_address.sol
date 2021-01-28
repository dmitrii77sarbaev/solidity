contract C {
    function f() external returns (address) {
        return this.f.address;
    }
    function g() external returns (bool) {
      return this.f.address == address(this);
    }
    function h(function() external a) public returns (address) {
      return a.address;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x0fdd67305928fcac8d213d1e47bfa6165cd0b87b
// gas Legacy: 21433
// gas LegacyOptimized: 21293
// gas Yul: 21972
// gas YulOptimized: 21454
// g() -> true
// gas Legacy: 21429
// gas LegacyOptimized: 21298
// gas Yul: 22161
// gas YulOptimized: 21465
// h(function): left(0x1122334400112233445566778899AABBCCDDEEFF42424242) -> 0x1122334400112233445566778899AABBCCDDEEFF
// gas Legacy: 22428
// gas LegacyOptimized: 21895
// gas Yul: 22755
// gas YulOptimized: 22000
