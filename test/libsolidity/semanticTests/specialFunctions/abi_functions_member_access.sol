contract C {
    function f() public pure {
        abi.encode;
        abi.encodePacked;
        abi.encodeWithSelector;
        abi.encodeWithSignature;
        abi.decode;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() ->
// gas Legacy: 21186
// gas LegacyOptimized: 21186
// gas Yul: 21572
// gas YulOptimized: 21214
