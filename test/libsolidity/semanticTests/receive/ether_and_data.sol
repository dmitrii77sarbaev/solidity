contract C {
    receive () payable external { }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// (), 1 ether
// gas Legacy: 21033
// gas LegacyOptimized: 21033
// gas Yul: 21067
// gas YulOptimized: 21039
// (), 1 ether: 1 -> FAILURE
// gas Legacy: 21180
// gas LegacyOptimized: 21180
// gas Yul: 21272
// gas YulOptimized: 21186
