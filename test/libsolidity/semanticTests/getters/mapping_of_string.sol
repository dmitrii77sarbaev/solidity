contract C {
    mapping(string => uint8[3]) public x;
    constructor() {
        x["abc"][0] = 1;
        x["abc"][2] = 3;
        x["abc"][1] = 2;
        x["def"][1] = 9;
    }
}
// ====
// compileViaYul: also
// ----
// x(string,uint256): 0x40, 0, 3, "abc" -> 1
// gas Legacy: 23938
// gas LegacyOptimized: 23279
// gas Yul: 25286
// gas YulOptimized: 23533
// x(string,uint256): 0x40, 1, 3, "abc" -> 2
// gas Legacy: 24000
// gas LegacyOptimized: 23341
// gas Yul: 25298
// gas YulOptimized: 23545
// x(string,uint256): 0x40, 2, 3, "abc" -> 3
// gas Legacy: 24000
// gas LegacyOptimized: 23341
// gas Yul: 25298
// gas YulOptimized: 23545
// x(string,uint256): 0x40, 0, 3, "def" -> 0x00
// gas Legacy: 23938
// gas LegacyOptimized: 23279
// gas Yul: 25286
// gas YulOptimized: 23533
// x(string,uint256): 0x40, 1, 3, "def" -> 9
// gas Legacy: 24000
// gas LegacyOptimized: 23341
// gas Yul: 25298
// gas YulOptimized: 23545
// x(string,uint256): 0x40, 2, 3, "def" -> 0x00
// gas Legacy: 24000
// gas LegacyOptimized: 23341
// gas Yul: 25298
// gas YulOptimized: 23545
