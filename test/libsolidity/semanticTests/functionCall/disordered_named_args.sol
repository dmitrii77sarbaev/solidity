contract test {
    function a(uint a, uint b, uint c) public returns (uint r) { r = a * 100 + b * 10 + c * 1; }
    function b() public returns (uint r) { r = a({c: 3, a: 1, b: 2}); }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// b() -> 123
// gas Legacy: 22450
// gas LegacyOptimized: 21741
// gas Yul: 23425
// gas YulOptimized: 21797
