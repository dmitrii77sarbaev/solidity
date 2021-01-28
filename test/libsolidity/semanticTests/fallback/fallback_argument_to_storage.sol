contract A {
    bytes public x;
    fallback (bytes calldata _input) external returns (bytes memory) {
        x = _input;
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
// gas Legacy: 44170
// gas LegacyOptimized: 43679
// gas Yul: 45614
// gas YulOptimized: 44036
// x() -> 0x20, 3, "abc"
// gas Legacy: 24597
// gas LegacyOptimized: 24377
// gas Yul: 23598
// gas YulOptimized: 22997
