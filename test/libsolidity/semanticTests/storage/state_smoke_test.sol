contract test {
    uint256 value1;
    uint256 value2;
    function get(uint8 which) public returns (uint256 value) {
        if (which == 0) return value1;
        else return value2;
    }
    function set(uint8 which, uint256 value) public {
        if (which == 0) value1 = value;
        else value2 = value;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// get(uint8): 0x00 -> 0
// gas Legacy: 22643
// gas LegacyOptimized: 22410
// gas Yul: 23270
// gas YulOptimized: 22577
// get(uint8): 0x01 -> 0
// gas Legacy: 22645
// gas LegacyOptimized: 22412
// gas Yul: 23283
// gas YulOptimized: 22590
// set(uint8,uint256): 0x00, 0x1234 ->
// gas Legacy: 41964
// gas LegacyOptimized: 41680
// gas Yul: 43553
// gas YulOptimized: 41785
// set(uint8,uint256): 0x01, 0x8765 ->
// gas Legacy: 41966
// gas LegacyOptimized: 41682
// gas Yul: 43555
// gas YulOptimized: 41787
// get(uint8): 0x00 -> 0x1234
// gas Legacy: 22643
// gas LegacyOptimized: 22410
// gas Yul: 23270
// gas YulOptimized: 22577
// get(uint8): 0x01 -> 0x8765
// gas Legacy: 22645
// gas LegacyOptimized: 22412
// gas Yul: 23283
// gas YulOptimized: 22590
// set(uint8,uint256): 0x00, 0x03 ->
// gas Legacy: 22752
// gas LegacyOptimized: 22468
// gas Yul: 24341
// gas YulOptimized: 22573
// get(uint8): 0x00 -> 0x03
// gas Legacy: 22643
// gas LegacyOptimized: 22410
// gas Yul: 23270
// gas YulOptimized: 22577
