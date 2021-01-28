contract C {
    uint8[1] s;
    function f() public returns (bool correct) {
        assembly {
            sstore(s.slot, 257)
        }
        uint8 x = s[0];
        uint r;
        assembly {
            r := x
        }
        correct = (s[0] == 0x01) && (r == 0x01);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 43240
// gas LegacyOptimized: 41282
// gas Yul: 44626
// gas YulOptimized: 43349
