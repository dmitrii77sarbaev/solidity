library L {
    function f(uint256[] storage x) public view returns (uint256) {
        return 84;
    }
}
contract C {
    uint256[] y;
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
// library: L// f() -> 84
// gas Legacy: 23868
// gas LegacyOptimized: 23255
// gas Yul: 24877
// gas YulOptimized: 23397
// g() -> true, 84
// gas Legacy: 24042
// gas LegacyOptimized: 23132
// gas Yul: 25180
// gas YulOptimized: 23079
// h() -> true, 84
// gas Legacy: 24023
// gas LegacyOptimized: 23113
// gas Yul: 25161
// gas YulOptimized: 23060
