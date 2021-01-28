contract C {
    function f() public returns (bytes1) {
        bytes memory x = new bytes(35);
        assert(x.length == 35);
        x[34] = "A";
        return (x[34]);
    }
}
// ====
// compileViaYul: also
// ----
// f() -> "A"
// gas Legacy: 21722
// gas LegacyOptimized: 21593
// gas Yul: 23477
// gas YulOptimized: 22021
