contract C {
    function dyn(uint x) public returns (bytes memory a) {
        assembly {
            mstore(0, 0x20)
            mstore(0x20, 0x21)
            return(0, x)
        }
    }
    function f(uint x) public returns (bool) {
        this.dyn(x);
        return true;
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256): 0x60 -> FAILURE
// gas Legacy: 24400
// gas LegacyOptimized: 23614
// gas Yul: 24868
// gas YulOptimized: 23604
// f(uint256): 0x61 -> true
// gas Legacy: 24956
// gas LegacyOptimized: 24016
// gas Yul: 25671
// gas YulOptimized: 24173
// f(uint256): 0x80 -> true
// gas Legacy: 24956
// gas LegacyOptimized: 24016
// gas Yul: 25671
// gas YulOptimized: 24173
