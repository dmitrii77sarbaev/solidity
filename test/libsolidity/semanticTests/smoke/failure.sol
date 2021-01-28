contract C {
    function e() public pure {
        revert("Transaction failed.");
    }
    function f(bool _value) public pure {
        string memory message;
        require(_value, message);
    }
    function g(bool _value) public pure {
        require(_value, "Value is false.");
    }
    function h() public pure returns (uint) {
        assert(false);
    }
}
// ====
// EVMVersion: >homestead
// allowNonExistingFunctions: true
// compileToEwasm: also
// compileViaYul: also
// ----
// _() -> FAILURE
// gas Legacy: 21234
// gas LegacyOptimized: 21234
// gas Yul: 21281
// gas YulOptimized: 21235
// e() -> FAILURE, hex"08c379a0", 0x20, 0x13, "Transaction failed."
// gas Legacy: 21542
// gas LegacyOptimized: 21387
// gas Yul: 21690
// gas YulOptimized: 21400
// f(bool): false -> FAILURE, hex"08c379a0", 0x20, 0x00
// gas Legacy: 22070
// gas LegacyOptimized: 21664
// gas Yul: 22203
// gas YulOptimized: 21626
// g(bool): false -> FAILURE, hex"08c379a0", 0x20, 0x0f, "Value is false."
// gas Legacy: 21930
// gas LegacyOptimized: 21620
// gas Yul: 22020
// gas YulOptimized: 21588
// h() -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 21242
// gas LegacyOptimized: 21232
// gas Yul: 21442
// gas YulOptimized: 21310
