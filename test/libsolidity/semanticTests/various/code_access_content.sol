contract D {
    bytes32 public x;

    constructor() {
        bytes32 codeHash;
        assembly {
            let size := codesize()
            codecopy(mload(0x40), 0, size)
            codeHash := keccak256(mload(0x40), size)
        }
        x = codeHash;
    }
}


contract C {
    function testRuntime() public returns (bool) {
        D d = new D();
        bytes32 runtimeHash = keccak256(type(D).runtimeCode);
        bytes32 otherHash;
        uint256 size;
        assembly {
            size := extcodesize(d)
            extcodecopy(d, mload(0x40), 0, size)
            otherHash := keccak256(mload(0x40), size)
        }
        require(size == type(D).runtimeCode.length);
        require(runtimeHash == otherHash);
        return true;
    }

    function testCreation() public returns (bool) {
        D d = new D();
        bytes32 creationHash = keccak256(type(D).creationCode);
        require(creationHash == d.x());
        return true;
    }
}
// ====
// compileViaYul: also
// ----
// testRuntime() -> true
// gas Legacy: 119814
// gas LegacyOptimized: 111842
// gas Yul: 164297
// gas YulOptimized: 91957
// testCreation() -> true
// gas Legacy: 121027
// gas LegacyOptimized: 112824
// gas Yul: 165984
// gas YulOptimized: 92804
