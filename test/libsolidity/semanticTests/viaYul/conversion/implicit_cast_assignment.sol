// Tests IRGeneratorForStatements::visit(Assignment const& _assignment)
contract C {
    function f() public pure returns (uint16 x) {
        uint8 y;
        assembly {
            y := 0x12345678
        }
        x = y;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x78
// gas Legacy: 21404
// gas LegacyOptimized: 21282
// gas Yul: 21917
// gas YulOptimized: 21229
