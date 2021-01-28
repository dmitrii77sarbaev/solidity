contract A {
    constructor() {
        assembly {
            // This is only 7 bytes here.
            mstore(0, 0x48aa5566000000)
            return(0, 32)
        }
    }
}

contract C {
    function f() public returns (bytes memory) { return address(new A()).code; }
    function g() public returns (uint) { return address(new A()).code.length; }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x20, 0x20, 0x48aa5566000000
// gas Legacy: 61775
// gas LegacyOptimized: 61537
// gas Yul: 62859
// gas YulOptimized: 61813
// g() -> 0x20
// gas Legacy: 60673
// gas LegacyOptimized: 60584
// gas Yul: 61324
// gas YulOptimized: 60794
