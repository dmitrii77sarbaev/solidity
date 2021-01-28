contract C {
    bytes data;
    bytes otherData;
    function fromMemory() public returns (bytes1) {
        bytes memory t;
        uint[2] memory x;
        x[0] = type(uint).max;
        data = t;
        data.push();
        return data[0];
    }
    function fromCalldata(bytes calldata x) public returns (bytes1) {
        data = x;
        data.push();
        return data[0];
    }
    function fromStorage() public returns (bytes1) {
        // zero-length but dirty higher order bits
        assembly  { sstore(otherData.slot, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00) }
        data = otherData;
        data.push();
        return data[0];
    }
}
// ====
// compileViaYul: also
// ----
// fromMemory() -> 0x00
// gas Legacy: 48816
// gas LegacyOptimized: 47848
// gas Yul: 49668
// gas YulOptimized: 48018
// fromCalldata(bytes): 0x40, 0x60, 0x00, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> 0x00
// gas Legacy: 31503
// gas LegacyOptimized: 30502
// gas Yul: 30668
// gas YulOptimized: 29579
// fromStorage() -> 0x00
// gas Legacy: 51237
// gas LegacyOptimized: 50320
// gas Yul: 50548
// gas YulOptimized: 49456
