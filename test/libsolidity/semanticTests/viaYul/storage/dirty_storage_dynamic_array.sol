contract C {
    uint8[] s;
    function f() public returns (bool correct) {
        s.push();
        assembly {
            mstore(0, s.slot)
            sstore(keccak256(0, 0x20), 257)
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
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 66744
// gas LegacyOptimized: 64871
// gas Yul: 68406
// gas YulOptimized: 66921
