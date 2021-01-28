contract test {
    constructor() payable {}

    function getBalance() public returns (uint256 balance) {
        return address(this).balance;
    }
}

// ====
// compileViaYul: also
// ----
// constructor(), 23 wei ->
// gas Legacy: 101165
// gas LegacyOptimized: 91931
// gas Yul: 144887
// gas YulOptimized: 70356
// getBalance() -> 23
// gas Legacy: 21381
// gas LegacyOptimized: 21272
// gas Yul: 22609
// gas YulOptimized: 21236
