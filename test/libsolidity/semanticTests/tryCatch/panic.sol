contract C {
    function uf(bool b, uint x, uint y) public pure returns (uint) {
        require(b, "failure");
        return x - y;
    }
    function onlyPanic(bool b, uint x, uint y) public returns (uint r, uint code) {
        try this.uf(b, x, y) returns (uint b) {
            r = b;
        } catch Panic(uint c) {
            code = c;
        }
    }
    function panicAndError(bool b, uint x, uint y) public returns (uint r, uint code, string memory msg_) {
        try this.uf(b, x, y) returns (uint b) {
            r = b;
        } catch Panic(uint c) {
            code = c;
        } catch Error(string memory _errmsg) {
            msg_ = _errmsg;
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// onlyPanic(bool,uint256,uint256): true, 7, 6 -> 1, 0x00
// gas Legacy: 25880
// gas LegacyOptimized: 24141
// gas Yul: 26885
// gas YulOptimized: 24615
// onlyPanic(bool,uint256,uint256): true, 6, 7 -> 0x00, 0x11
// gas Legacy: 25669
// gas LegacyOptimized: 24143
// gas Yul: 26375
// gas YulOptimized: 24432
// onlyPanic(bool,uint256,uint256): false, 7, 6 -> FAILURE, hex"08c379a0", 0x20, 7, "failure"
// gas Legacy: 25348
// gas LegacyOptimized: 23980
// gas Yul: 25832
// gas YulOptimized: 24031
// onlyPanic(bool,uint256,uint256): false, 6, 7 -> FAILURE, hex"08c379a0", 0x20, 7, "failure"
// gas Legacy: 25348
// gas LegacyOptimized: 23980
// gas Yul: 25832
// gas YulOptimized: 24031
// panicAndError(bool,uint256,uint256): true, 7, 6 -> 1, 0x00, 0x60, 0x00
// gas Legacy: 26304
// gas LegacyOptimized: 24343
// gas Yul: 27358
// gas YulOptimized: 24806
// panicAndError(bool,uint256,uint256): true, 6, 7 -> 0x00, 0x11, 0x60, 0x00
// gas Legacy: 26116
// gas LegacyOptimized: 24357
// gas Yul: 26870
// gas YulOptimized: 24645
// panicAndError(bool,uint256,uint256): false, 7, 6 -> 0x00, 0x00, 0x60, 7, "failure"
// gas Legacy: 26640
// gas LegacyOptimized: 24802
// gas Yul: 27423
// gas YulOptimized: 25063
// panicAndError(bool,uint256,uint256): false, 6, 7 -> 0x00, 0x00, 0x60, 7, "failure"
// gas Legacy: 26640
// gas LegacyOptimized: 24802
// gas Yul: 27423
// gas YulOptimized: 25063
