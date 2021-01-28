contract C {
    function() returns (uint256) internal x;
    int256 mutex;

    function t() public returns (uint256) {
        if (mutex > 0) {
            assembly {
                mstore(0, 7)
                return(0, 0x20)
            }
        }
        mutex = 1;
        // Avoid re-executing this function if we jump somewhere.
        x();
        return 2;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// t() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 42915
// gas LegacyOptimized: 42883
// gas Yul: 44741
// gas YulOptimized: 42061
