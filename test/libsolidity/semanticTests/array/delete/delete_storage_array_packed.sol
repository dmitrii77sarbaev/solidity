contract C {
    uint120[] data;

    function f() public returns (uint120, uint120, uint120) {
        data.push(123);
        data.push(234);
        data.push(345);
        delete data;
        assembly {
            sstore(data.slot, 3)
        }
        return (data[0], data[1], data[2]);
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0, 0, 0
// gas Legacy: 99137
// gas LegacyOptimized: 94969
// gas Yul: 107749
// gas YulOptimized: 101935
