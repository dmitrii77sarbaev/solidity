contract C {
    struct S {
        uint a;
        uint b;
    }

    mapping(uint => S) public mappingAccess;

    function data() internal view returns (S storage _data) {
        // We need to assign it from somewhere, otherwise we would
        // get an "uninitialized access" error.
        _data = mappingAccess[20];

        bytes32 slot = keccak256(abi.encode(uint(1), uint(0)));
        assembly {
            _data.slot := slot
        }
    }

    function set(uint x) public {
        data().a = x;
    }

    function get() public view returns (uint) {
        return data().a;
    }
}
// ====
// compileViaYul: also
// ----
// get() -> 0
// gas Legacy: 22726
// gas LegacyOptimized: 22378
// gas Yul: 23908
// gas YulOptimized: 22590
// mappingAccess(uint256): 1 -> 0, 0
// gas Legacy: 23595
// gas LegacyOptimized: 23211
// gas Yul: 24364
// gas YulOptimized: 23406
// set(uint256): 4
// gas Legacy: 42108
// gas LegacyOptimized: 41670
// gas Yul: 44159
// gas YulOptimized: 41860
// get() -> 4
// gas Legacy: 22726
// gas LegacyOptimized: 22378
// gas Yul: 23908
// gas YulOptimized: 22590
// mappingAccess(uint256): 1 -> 4, 0
// gas Legacy: 23595
// gas LegacyOptimized: 23211
// gas Yul: 24364
// gas YulOptimized: 23406
