contract Test {
    struct RecursiveStruct {
        RecursiveStruct[] vals;
    }

    function func() public pure {
        RecursiveStruct[1] memory val = [ RecursiveStruct(new RecursiveStruct[](42)) ];
        assert(val[0].vals.length == 42);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// func() ->
// gas Legacy: 26179
// gas LegacyOptimized: 26063
// gas Yul: 43716
// gas YulOptimized: 31083
