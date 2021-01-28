contract C {
    function f(int8 a, uint8 b) public returns (int256) {
        return a >> b;
    }
}

// ====
// compileViaYul: also
// ----
// f(int8,uint8): -66, 0 -> -66
// gas Legacy: 22502
// gas LegacyOptimized: 22120
// gas Yul: 23142
// gas YulOptimized: 22166
// f(int8,uint8): -66, 1 -> -33
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -66, 4 -> -5
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -66, 8 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -66, 16 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -66, 17 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -67, 0 -> -67
// gas Legacy: 22502
// gas LegacyOptimized: 22120
// gas Yul: 23142
// gas YulOptimized: 22166
// f(int8,uint8): -67, 1 -> -34
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -67, 4 -> -5
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -67, 8 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -67, 16 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int8,uint8): -67, 17 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
