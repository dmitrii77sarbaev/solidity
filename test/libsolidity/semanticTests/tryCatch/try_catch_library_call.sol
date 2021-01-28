library L {
    struct S { uint x; }
    function integer(uint t, bool b) public view returns (uint) {
        if (b) {
            return t;
        } else {
            revert("failure");
        }
    }
    function stru(S storage t, bool b) public view returns (uint) {
        if (b) {
            return t.x;
        } else {
            revert("failure");
        }
    }
}
contract C {
    using L for L.S;
    L.S t;
    function f(bool b) public returns (uint, string memory) {
        uint x = 8;
        try L.integer(x, b) returns (uint _x) {
            return (_x, "");
        } catch Error(string memory message) {
            return (18, message);
        }
    }
    function g(bool b) public returns (uint, string memory) {
        t.x = 9;
        try t.stru(b) returns (uint x) {
            return (x, "");
        } catch Error(string memory message) {
            return (19, message);
        }
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// library: L// f(bool): true -> 8, 0x40, 0
// gas Legacy: 25119
// gas LegacyOptimized: 23920
// gas Yul: 26572
// gas YulOptimized: 24464
// f(bool): false -> 18, 0x40, 7, "failure"
// gas Legacy: 25588
// gas LegacyOptimized: 24387
// gas Yul: 26360
// gas YulOptimized: 24571
// g(bool): true -> 9, 0x40, 0
// gas Legacy: 45895
// gas LegacyOptimized: 44729
// gas Yul: 48639
// gas YulOptimized: 45141
// g(bool): false -> 19, 0x40, 7, "failure"
// gas Legacy: 26358
// gas LegacyOptimized: 25182
// gas Yul: 28239
// gas YulOptimized: 25311
