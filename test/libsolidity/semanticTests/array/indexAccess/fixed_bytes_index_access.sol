contract C {
    bytes16[] public data;

    function f(bytes32 x) public returns (bytes1) {
        return x[2];
    }

    function g(bytes32 x) public returns (uint256) {
        data = [x[0], x[1], x[2]];
        data[0] = "12345";
        return uint256(uint8(data[0][4]));
    }
}
// ====
// compileViaYul: also
// ----
// f(bytes32): "789" -> "9"
// gas Legacy: 21871
// gas LegacyOptimized: 21569
// gas Yul: 22320
// gas YulOptimized: 21711
// g(bytes32): "789" -> 0x35
// gas Legacy: 93036
// gas LegacyOptimized: 92718
// gas Yul: 95606
// gas YulOptimized: 91840
// data(uint256): 0x01 -> "8"
// gas Legacy: 23625
// gas LegacyOptimized: 23350
// gas Yul: 25115
// gas YulOptimized: 24323
