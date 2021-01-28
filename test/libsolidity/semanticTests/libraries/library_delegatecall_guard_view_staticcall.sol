contract D {
    uint public x;
    constructor() { x = 42; }
}
library L {
    function f(D d) public view returns (uint256) {
        return d.x();
    }
}
contract C {
    D d;
    constructor() { d = new D(); }
    function f() public view returns (uint256) {
        return L.f(d);
    }
    function g() public returns (bool, uint256) {
        (bool success, bytes memory data) = address(L).delegatecall(abi.encodeWithSelector(L.f.selector, d));
        return (success, success ? abi.decode(data,(uint256)) : 0);
    }
    function h() public returns (bool, uint256) {
        (bool success, bytes memory data) = address(L).call(abi.encodeWithSelector(L.f.selector, d));
        return (success, success ? abi.decode(data,(uint256)) : 0);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// library: L// f() -> 42
// gas Legacy: 27857
// gas LegacyOptimized: 26826
// gas Yul: 29926
// gas YulOptimized: 27124
// g() -> true, 42
// gas Legacy: 27983
// gas LegacyOptimized: 26704
// gas Yul: 30164
// gas YulOptimized: 26803
// h() -> true, 42
// gas Legacy: 27964
// gas LegacyOptimized: 26685
// gas Yul: 30145
// gas YulOptimized: 26784
