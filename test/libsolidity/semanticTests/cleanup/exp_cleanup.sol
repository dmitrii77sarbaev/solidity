contract C {
    function f() public pure returns (uint x) {
        unchecked {
            uint8 y = uint8(2)**uint8(8);
            return 0**y;
        }
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 0x1
// gas Legacy: 21486
// gas LegacyOptimized: 21270
// gas Yul: 22535
// gas YulOptimized: 21229
