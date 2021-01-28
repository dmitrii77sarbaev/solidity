contract A {
    uint public x;
    // Signature is d88e0b00
    function fow() public { x = 3; }
    fallback () external { x = 2; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// (): hex"d88e0b"
// gas Legacy: 41127
// gas LegacyOptimized: 41118
// gas Yul: 42350
// gas YulOptimized: 41144
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22208
// (): hex"d88e0b00"
// gas Legacy: 22010
// gas LegacyOptimized: 22002
// gas Yul: 23613
// gas YulOptimized: 22199
// x() -> 3
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22208
// (): hex"d88e"
// gas Legacy: 21911
// gas LegacyOptimized: 21902
// gas Yul: 23134
// gas YulOptimized: 21928
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22208
// (): hex"d88e0b00"
// gas Legacy: 22010
// gas LegacyOptimized: 22002
// gas Yul: 23613
// gas YulOptimized: 22199
// x() -> 3
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22208
// (): hex"d8"
// gas Legacy: 21895
// gas LegacyOptimized: 21886
// gas Yul: 23118
// gas YulOptimized: 21912
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22208
