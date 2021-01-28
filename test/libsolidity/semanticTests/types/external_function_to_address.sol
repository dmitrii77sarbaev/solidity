contract C {
    function f() public returns (bool) {
        return this.f.address == address(this);
    }
    function g(function() external cb) public returns (address) {
        return cb.address;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 21407
// gas LegacyOptimized: 21276
// gas Yul: 22139
// gas YulOptimized: 21344
// g(function): hex"00000000000000000000000000000000000004226121ff00000000000000000" -> 0x42
// gas Legacy: 22190
// gas LegacyOptimized: 21657
// gas Yul: 22517
// gas YulOptimized: 21683
