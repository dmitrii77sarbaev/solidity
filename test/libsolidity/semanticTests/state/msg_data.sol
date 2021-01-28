contract C {
    function f() public returns (bytes calldata) {
        return msg.data;
    }
    function g(uint,bool) public returns (bytes calldata) {
        return msg.data;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x20, 4, 17219911917854084299749778639755835327755045716242581057573779540915269926912
// gas Legacy: 21599
// gas LegacyOptimized: 21385
// gas Yul: 22012
// gas YulOptimized: 21496
// g(uint256,bool): 1234, true -> 0x20, 0x44, 35691323728519381642872894128098848782337736632589179916067422734266033766400, 33268574187263889506619096617382224251268236217415066441681855047532544, 26959946667150639794667015087019630673637144422540572481103610249216
// gas Legacy: 22369
// gas LegacyOptimized: 21857
// gas Yul: 22710
// gas YulOptimized: 21937
