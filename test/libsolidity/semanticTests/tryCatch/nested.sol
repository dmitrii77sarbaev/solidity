contract C {
    function g(bool b) public pure returns (uint, uint) {
        require(b, "failure");
        return (1, 2);
    }
    function f(bool cond1, bool cond2) public returns (uint x, uint y, bytes memory txt) {
        try this.g(cond1) returns (uint a, uint b) {
            try this.g(cond2) returns (uint a2, uint b2) {
                (x, y) = (a, b);
                txt = "success";
            } catch Error(string memory s) {
                x = 12;
                txt = bytes(s);
            } catch (bytes memory s) {
                x = 13;
                txt = s;
            }
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
// f(bool,bool): true, true -> 1, 2, 96, 7, "success"
// gas Legacy: 28598
// gas LegacyOptimized: 26570
// gas Yul: 27392
// gas YulOptimized: 27392
// f(bool,bool): true, false -> 12, 0, 96, 7, "failure"
// gas Legacy: 28675
// gas LegacyOptimized: 26855
// gas Yul: 27319
// gas YulOptimized: 27319
// f(bool,bool): false, true -> 99, 0, 96, 7, "failure"
// gas Legacy: 25761
// gas LegacyOptimized: 24657
// gas Yul: 24847
// gas YulOptimized: 24847
// f(bool,bool): false, false -> 99, 0, 96, 7, "failure"
// gas Legacy: 25749
// gas LegacyOptimized: 24645
// gas Yul: 24835
// gas YulOptimized: 24835
