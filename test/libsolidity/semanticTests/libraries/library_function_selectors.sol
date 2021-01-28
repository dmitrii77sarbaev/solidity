library L {
    function f(uint256 x) external returns (uint) { return x; }
    function g(uint256[] storage s) external returns (uint) { return s.length; }
    function h(uint256[] memory m) public returns (uint) { return m.length; }
}
contract C {
    uint256[] s;
    constructor() { while (s.length < 42) s.push(0); }
    function f() public returns (bool, bool, uint256) {
		(bool success, bytes memory data) = address(L).delegatecall(abi.encodeWithSelector(L.f.selector, 7));
		return (L.f.selector == bytes4(keccak256("f(uint256)")), success, abi.decode(data, (uint256)));
    }
    function g() public returns (bool, bool, uint256) {
		uint256 s_ptr;
		assembly { s_ptr := s.slot }
		(bool success, bytes memory data) = address(L).delegatecall(abi.encodeWithSelector(L.g.selector, s_ptr));
		return (L.g.selector == bytes4(keccak256("g(uint256[] storage)")), success, abi.decode(data, (uint256)));
    }
    function h() public returns (bool, bool, uint256) {
		(bool success, bytes memory data) = address(L).delegatecall(abi.encodeWithSelector(L.h.selector, new uint256[](23)));
		return (L.h.selector == bytes4(keccak256("h(uint256[])")), success, abi.decode(data, (uint256)));
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// library: L// f() -> true, true, 7
// gas Legacy: 24221
// gas LegacyOptimized: 23173
// gas Yul: 25433
// gas YulOptimized: 23315
// g() -> true, true, 42
// gas Legacy: 25059
// gas LegacyOptimized: 24040
// gas Yul: 26314
// gas YulOptimized: 24181
// h() -> true, true, 23
// gas Legacy: 38718
// gas LegacyOptimized: 29575
// gas Yul: 38767
// gas YulOptimized: 28494
