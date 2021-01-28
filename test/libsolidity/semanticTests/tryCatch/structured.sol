contract C {
    function g(bool b) public pure returns (uint, uint) {
        require(b, "message");
        return (1, 2);
    }
    function f(bool b) public returns (uint x, uint y, string memory txt) {
        try this.g(b) returns (uint a, uint b) {
            (x, y) = (a, b);
            txt = "success";
        } catch Error(string memory s) {
            txt = s;
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// f(bool): true -> 1, 2, 0x60, 7, "success"
// gas Legacy: 25368
// gas LegacyOptimized: 24063
// gas Yul: 27089
// gas YulOptimized: 24631
// f(bool): false -> 0, 0, 0x60, 7, "message"
// gas Legacy: 25437
// gas LegacyOptimized: 24350
// gas Yul: 26187
// gas YulOptimized: 24531
