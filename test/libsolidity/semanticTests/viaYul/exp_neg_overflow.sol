contract C {
    function f(int8 x, uint y) public returns (int) {
        return x**y;
    }
    function g(int256 x, uint y) public returns (int) {
        return x**y;
    }
}
// ====
// compileViaYul: also
// ----
// f(int8,uint256): 2, 6 -> 64
// gas Legacy: 23021
// gas LegacyOptimized: 22369
// gas Yul: 23429
// gas YulOptimized: 22541
// f(int8,uint256): 2, 7 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22746
// gas LegacyOptimized: 22210
// gas Yul: 22847
// gas YulOptimized: 22283
// f(int8,uint256): 2, 8 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22673
// gas LegacyOptimized: 22140
// gas Yul: 22773
// gas YulOptimized: 22207
// f(int8,uint256): -2, 6 -> 64
// gas Legacy: 23404
// gas LegacyOptimized: 22748
// gas Yul: 23812
// gas YulOptimized: 22924
// f(int8,uint256): -2, 7 -> -128
// gas Legacy: 23412
// gas LegacyOptimized: 22753
// gas Yul: 23820
// gas YulOptimized: 22932
// f(int8,uint256): -2, 8 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23056
// gas LegacyOptimized: 22519
// gas Yul: 23156
// gas YulOptimized: 22590
// f(int8,uint256): 6, 3 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22560
// gas LegacyOptimized: 22075
// gas Yul: 22659
// gas YulOptimized: 22111
// f(int8,uint256): 7, 2 -> 0x31
// gas Legacy: 22835
// gas LegacyOptimized: 22234
// gas Yul: 23241
// gas YulOptimized: 22369
// f(int8,uint256): 7, 3 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22560
// gas LegacyOptimized: 22075
// gas Yul: 22659
// gas YulOptimized: 22111
// f(int8,uint256): -7, 2 -> 0x31
// gas Legacy: 23218
// gas LegacyOptimized: 22613
// gas Yul: 23624
// gas YulOptimized: 22752
// f(int8,uint256): -7, 3 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22989
// gas LegacyOptimized: 22500
// gas Yul: 23088
// gas YulOptimized: 22540
// f(int8,uint256): -7, 4 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22886
// gas LegacyOptimized: 22398
// gas Yul: 22984
// gas YulOptimized: 22434
// f(int8,uint256): 127, 31 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22281
// gas LegacyOptimized: 21871
// gas Yul: 22378
// gas YulOptimized: 21862
// f(int8,uint256): 127, 131 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22281
// gas LegacyOptimized: 21871
// gas Yul: 22378
// gas YulOptimized: 21862
// f(int8,uint256): -128, 0 -> 1
// gas Legacy: 22757
// gas LegacyOptimized: 22237
// gas Yul: 23155
// gas YulOptimized: 22311
// f(int8,uint256): -128, 1 -> -128
// gas Legacy: 22791
// gas LegacyOptimized: 22271
// gas Yul: 23189
// gas YulOptimized: 22345
// f(int8,uint256): -128, 31 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22675
// gas LegacyOptimized: 22262
// gas Yul: 22772
// gas YulOptimized: 22256
// f(int8,uint256): -128, 131 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22675
// gas LegacyOptimized: 22262
// gas Yul: 22772
// gas YulOptimized: 22256
// f(int8,uint256): -11, 2 -> 121
// gas Legacy: 23218
// gas LegacyOptimized: 22613
// gas Yul: 23624
// gas YulOptimized: 22752
// f(int8,uint256): -12, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22675
// gas LegacyOptimized: 22262
// gas Yul: 22772
// gas YulOptimized: 22256
// f(int8,uint256): 12, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22281
// gas LegacyOptimized: 21871
// gas Yul: 22378
// gas YulOptimized: 21862
// f(int8,uint256): -5, 3 -> -125
// gas Legacy: 23226
// gas LegacyOptimized: 22618
// gas Yul: 23632
// gas YulOptimized: 22760
// f(int8,uint256): -6, 3 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22989
// gas LegacyOptimized: 22500
// gas Yul: 23088
// gas YulOptimized: 22540
// g(int256,uint256): -7, 90 -> 11450477594321044359340126713545146077054004823284978858214566372120240027249
// gas Legacy: 24070
// gas LegacyOptimized: 23203
// gas Yul: 24413
// gas YulOptimized: 23439
// g(int256,uint256): -7, 91 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23849
// gas LegacyOptimized: 23098
// gas Yul: 23970
// gas YulOptimized: 23242
// g(int256,uint256): -63, 42 -> 3735107253208426854890677539053540390278853997836851167913009474475553834369
// gas Legacy: 23884
// gas LegacyOptimized: 23068
// gas Yul: 24225
// gas YulOptimized: 23267
// g(int256,uint256): -63, 43 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 23663
// gas LegacyOptimized: 22963
// gas Yul: 23782
// gas YulOptimized: 23070
