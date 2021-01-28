contract Lotto {
    uint256 public constant ticketPrice = 555;
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// ticketPrice() -> 555
// gas Legacy: 21371
// gas LegacyOptimized: 21270
// gas Yul: 21840
// gas YulOptimized: 21229
