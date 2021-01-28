contract D {
    uint256 x;

    constructor() {
        x = 7;
    }

    function f() public view returns (uint256) {
        return x;
    }
}

contract C {
    function test() public returns (uint256) {
        D d = new D();
        bytes32 hash;
        assembly { hash := extcodehash(d) }
        assert(hash == keccak256(type(D).runtimeCode));
        return 42;
    }
}

// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// test() -> 42
// gas Legacy: 119201
// gas LegacyOptimized: 110663
// gas Yul: 164781
// gas YulOptimized: 90572
