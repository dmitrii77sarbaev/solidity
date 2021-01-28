contract test {
    mapping(uint8 => uint8) a;
    mapping(uint8 => uint8) b;
    function set_internal(mapping(uint8 => uint8) storage m, uint8 key, uint8 value) internal returns (uint8) {
        uint8 oldValue = m[key];
        m[key] = value;
        return oldValue;
    }
    function set(uint8 key, uint8 value_a, uint8 value_b) public returns (uint8 old_a, uint8 old_b) {
        old_a = set_internal(a, key, value_a);
        old_b = set_internal(b, key, value_b);
    }
    function get(uint8 key) public returns (uint8, uint8) {
        return (a[key], b[key]);
    }
}
// ====
// compileViaYul: also
// ----
// set(uint8,uint8,uint8): 1, 21, 42 -> 0, 0
// gas Legacy: 66449
// gas LegacyOptimized: 63998
// gas Yul: 68114
// gas YulOptimized: 65863
// get(uint8): 1 -> 21, 42
// gas Legacy: 23787
// gas LegacyOptimized: 23373
// gas Yul: 24643
// gas YulOptimized: 23597
// set(uint8,uint8,uint8): 1, 10, 11 -> 21, 42
// gas Legacy: 28049
// gas LegacyOptimized: 25598
// gas Yul: 29714
// gas YulOptimized: 27463
// get(uint8): 1 -> 10, 11
// gas Legacy: 23787
// gas LegacyOptimized: 23373
// gas Yul: 24643
// gas YulOptimized: 23597
