contract A {
    fallback (bytes calldata _input) virtual external returns (bytes memory) {
        return _input;
    }
}
contract B is A {
    fallback () override external {
    }
    function f() public returns (bool, bytes memory) {
        (bool success, bytes memory retval) = address(this).call("abc");
        return (success, retval);
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// f() -> 1, 0x40, 0x00
// gas Legacy: 22853
// gas LegacyOptimized: 22368
// gas Yul: 23513
// gas YulOptimized: 22375
