contract C {
    function f(int16 a, uint16 b) public returns (int256) {
        return a >> b;
    }
}

// ====
// compileViaYul: also
// ----
// f(int16,uint16): -4266, 0 -> -4266
// gas Legacy: 22502
// gas LegacyOptimized: 22120
// gas Yul: 23142
// gas YulOptimized: 22166
// f(int16,uint16): -4266, 1 -> -2133
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4266, 4 -> -267
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4266, 8 -> -17
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4266, 16 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4266, 17 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4267, 0 -> -4267
// gas Legacy: 22502
// gas LegacyOptimized: 22120
// gas Yul: 23142
// gas YulOptimized: 22166
// f(int16,uint16): -4267, 1 -> -2134
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4267, 4 -> -267
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4267, 8 -> -17
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4267, 16 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
// f(int16,uint16): -4267, 17 -> -1
// gas Legacy: 22514
// gas LegacyOptimized: 22132
// gas Yul: 23154
// gas YulOptimized: 22178
