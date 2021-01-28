contract B
{
}

contract A {
    function different_salt() public returns (bool) {
        B x = new B{salt: "abc"}();
        B y = new B{salt: "abcef"}();
        return x != y;
    }
    function same_salt() public returns (bool) {
        B x = new B{salt: "xyz"}();
        try new B{salt: "xyz"}() {} catch {
            return true;
        }
        return false;
    }
}
// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// different_salt() -> true
// gas Legacy: 127534
// gas LegacyOptimized: 127469
// gas Yul: 107186
// gas YulOptimized: 89963
// same_salt() -> true
// gas Legacy: 98439414
// gas LegacyOptimized: 98439313
// gas Yul: 98439503
// gas YulOptimized: 98439083
