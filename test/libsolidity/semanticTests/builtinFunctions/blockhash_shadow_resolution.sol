contract C {
    function blockhash(uint256 blockNumber) public returns(bytes32) { bytes32 x; return x; }
    function f() public returns(bytes32) { return blockhash(3); }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0
// gas Legacy: 21427
// gas LegacyOptimized: 21310
// gas Yul: 21950
// gas YulOptimized: 21344
