library L {
    function f(uint256[] storage x) public view returns (uint256) {
        return x.length;
    }
}
contract C {
    uint256[] y;
    string x;
    constructor() { y.push(42); }
    function f() public view returns (uint256) {
        return L.f(y);
    }
    function g() public returns (bool, uint256) {
        uint256 ys;
        assembly { ys := y.slot }
        (bool success, bytes memory data) = address(L).delegatecall(abi.encodeWithSelector(L.f.selector, ys));
        return (success, success ? abi.decode(data,(uint256)) : 0);
    }
    function h() public returns (bool, uint256) {
        uint256 ys;
        assembly { ys := y.slot }
        (bool success, bytes memory data) = address(L).call(abi.encodeWithSelector(L.f.selector, ys));
        return (success, success ? abi.decode(data,(uint256)) : 0);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// library: L// f() -> 1
// gas Legacy: 24676
// gas LegacyOptimized: 24050
// gas Yul: 25633
// gas YulOptimized: 24205
// g() -> true, 1
// gas Legacy: 24850
// gas LegacyOptimized: 23927
// gas Yul: 25936
// gas YulOptimized: 23887
// h() -> true, 0 # this is bad - this should fail! #
// gas Legacy: 24831
// gas LegacyOptimized: 23908
// gas Yul: 25917
// gas YulOptimized: 23868
