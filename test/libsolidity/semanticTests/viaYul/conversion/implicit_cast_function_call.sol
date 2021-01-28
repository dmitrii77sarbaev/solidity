// IRGeneratorForStatements::visit(FunctionCall const& _functionCall)
contract C {
    function f(uint b) public pure returns (uint x) {
        x = b;
    }
    function g() public pure returns (uint x) {
        uint8 a;
        assembly {
            a := 0x12345678
        }
        x = f(a);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// g() -> 0x78
// gas Legacy: 21463
// gas LegacyOptimized: 21332
// gas Yul: 22022
// gas YulOptimized: 21459
