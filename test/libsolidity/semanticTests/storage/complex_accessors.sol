contract test {
    mapping(uint256 => bytes4) public to_string_map;
    mapping(uint256 => bool) public to_bool_map;
    mapping(uint256 => uint256) public to_uint_map;
    mapping(uint256 => mapping(uint256 => uint256)) public to_multiple_map;
    constructor() {
        to_string_map[42] = "24";
        to_bool_map[42] = false;
        to_uint_map[42] = 12;
        to_multiple_map[42][23] = 31;
    }
}
// ====
// compileViaYul: also
// ----
// to_string_map(uint256): 42 -> "24"
// gas Legacy: 22722
// gas LegacyOptimized: 22433
// gas Yul: 23364
// gas YulOptimized: 22566
// to_bool_map(uint256): 42 -> false
// gas Legacy: 22678
// gas LegacyOptimized: 22365
// gas Yul: 23270
// gas YulOptimized: 22516
// to_uint_map(uint256): 42 -> 12
// gas Legacy: 22713
// gas LegacyOptimized: 22419
// gas Yul: 23324
// gas YulOptimized: 22570
// to_multiple_map(uint256,uint256): 42, 23 -> 31
// gas Legacy: 23045
// gas LegacyOptimized: 22610
// gas Yul: 23811
// gas YulOptimized: 22879
