contract C {
    function g(bool b) public pure returns (uint, uint) {
        require(b, "message longer than 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes");
        return (1, 2);
    }
    function f(bool cond) public returns (uint x, uint y, bytes memory txt) {
        try this.g(cond) returns (uint a, uint b) {
            (x, y) = (a, b);
            txt = "success";
        } catch Error(string memory s) {
            x = 99;
            txt = bytes(s);
        } catch (bytes memory s) {
            x = 98;
            txt = s;
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// f(bool): true -> 1, 2, 96, 7, "success"
// gas Legacy: 25368
// gas LegacyOptimized: 24063
// gas Yul: 27089
// gas YulOptimized: 24631
// f(bool): false -> 99, 0, 96, 82, "message longer than 32 bytes 32 ", "bytes 32 bytes 32 bytes 32 bytes", " 32 bytes 32 bytes"
// gas Legacy: 25649
// gas LegacyOptimized: 24570
// gas Yul: 26533
// gas YulOptimized: 24769
