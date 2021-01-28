contract C {
    function f() public payable returns (uint ret) {
        assembly {
            ret := selfbalance()
        }
    }
}
// ====
// EVMVersion: >=istanbul
// compileViaYul: also
// ----
// f(), 254 wei -> 254
// gas Legacy: 21357
// gas LegacyOptimized: 21248
// gas Yul: 21743
// gas YulOptimized: 21214
