// A long time ago, some opcodes were renamed, which involved the opcodes
// "iszero" and "not".
contract C {
    function f() public returns (bool) {
        bytes32 x = bytes32(uint256(1));
        assembly {
            x := not(x)
        }
        if (x != ~bytes32(uint256(1))) return false;
        assembly {
            x := iszero(x)
        }
        if (x != bytes32(0)) return false;
        return true;
    }
}

// ====
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 21488
// gas LegacyOptimized: 21276
// gas Yul: 22664
// gas YulOptimized: 21229
