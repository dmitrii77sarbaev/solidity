library D {
    function f(bytes calldata _x) public pure returns (bytes1) {
        return _x[0];
    }
    function g(bytes memory _x) public pure returns (bytes1) {
        return _x[0];
    }
}

contract C {
    using D for bytes;
    function f(bytes calldata _x) public pure returns (bytes1, bytes1) {
        return (_x.f(), _x.g());
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// library: D// f(bytes): 0x20, 4, "abcd" -> 0x6100000000000000000000000000000000000000000000000000000000000000, 0x6100000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 29216
// gas LegacyOptimized: 27550
// gas Yul: 31910
// gas YulOptimized: 28464
