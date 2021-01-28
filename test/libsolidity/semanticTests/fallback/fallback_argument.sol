contract A {
    uint public x;
    fallback (bytes calldata _input) external returns (bytes memory) {
        x = _input.length;
        return "";
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
// f() -> 0x01, 0x40, 0x00
// gas Legacy: 42973
// gas LegacyOptimized: 42437
// gas Yul: 45321
// gas YulOptimized: 42796
// x() -> 3
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
