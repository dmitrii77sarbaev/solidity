contract C {
    uint public x = msg.value - 10;
    constructor() payable {}
}

contract D {
    function f() public {
        unchecked {
            new C();
        }
    }
    function g() public payable returns (uint) {
        return (new C{value: 11}()).x();
    }
}
// ====
// compileViaYul: also
// ----
// f() -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 60787
// gas LegacyOptimized: 60646
// gas Yul: 61181
// gas YulOptimized: 60619
// g(), 100 wei -> 1
// gas Legacy: 120754
// gas LegacyOptimized: 112448
// gas Yul: 165194
// gas YulOptimized: 92461
