contract Lotto {
    uint256 public ticketPrice = 500;
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// ticketPrice() -> 500
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
