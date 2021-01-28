contract C {
    function f() public returns (address payable) {
        return block.coinbase;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x7878787878787878787878787878787878787878
// gas Legacy: 21427
// gas LegacyOptimized: 21293
// gas Yul: 21821
// gas YulOptimized: 21228
// f() -> 0x7878787878787878787878787878787878787878
// gas Legacy: 21427
// gas LegacyOptimized: 21293
// gas Yul: 21821
// gas YulOptimized: 21228
// f() -> 0x7878787878787878787878787878787878787878
// gas Legacy: 21427
// gas LegacyOptimized: 21293
// gas Yul: 21821
// gas YulOptimized: 21228
