==== Source: a.sol ====

import "a.sol" as M;

library L {
    function f(uint256 v) external pure returns (uint) {
        return v * v;
    }
    function g(uint256 v) external returns (uint) {
        return v * v;
    }
}
contract C {
    function addr() public view returns (bool) {
        return address(M.L) == address(0);
    }
    function g(uint256 v) public view returns (uint256) {
        return M.L.f(v);
    }
    function h(uint256 v) public returns (uint256) {
        (bool success, bytes memory result) = address(M.L).delegatecall(abi.encodeWithSignature("f(uint256)", v));
        assert(success);
        return abi.decode(result, (uint256));
    }
    function i(uint256 v) public returns (uint256) {
        (bool success, bytes memory result) = address(M.L).call(abi.encodeWithSignature("f(uint256)", v));
        assert(success);
        return abi.decode(result, (uint256));
    }
    function j(uint256 v) public returns (uint256) {
        (bool success, bytes memory result) = address(M.L).delegatecall(abi.encodeWithSignature("g(uint256)", v));
        assert(success);
        return abi.decode(result, (uint256));
    }
    function k(uint256 v) public returns (uint256) {
        (bool success, bytes memory result) = address(M.L).call(abi.encodeWithSignature("g(uint256)", v));
        assert(success);
        return abi.decode(result, (uint256));
    }
}
// ====
// EVMVersion: >=byzantium
// compileViaYul: also
// ----
// library: L// addr() -> false
// gas Legacy: 21435
// gas LegacyOptimized: 21329
// gas Yul: 22216
// gas YulOptimized: 21534
// g(uint256): 1 -> 1
// gas Legacy: 24636
// gas LegacyOptimized: 23681
// gas Yul: 25477
// gas YulOptimized: 23963
// g(uint256): 2 -> 4
// gas Legacy: 24636
// gas LegacyOptimized: 23681
// gas Yul: 25477
// gas YulOptimized: 23963
// g(uint256): 4 -> 16
// gas Legacy: 24636
// gas LegacyOptimized: 23681
// gas Yul: 25477
// gas YulOptimized: 23963
// h(uint256): 1 -> 1
// gas Legacy: 24566
// gas LegacyOptimized: 23407
// gas Yul: 25341
// gas YulOptimized: 23537
// h(uint256): 2 -> 4
// gas Legacy: 24566
// gas LegacyOptimized: 23407
// gas Yul: 25341
// gas YulOptimized: 23537
// h(uint256): 4 -> 16
// gas Legacy: 24566
// gas LegacyOptimized: 23407
// gas Yul: 25341
// gas YulOptimized: 23537
// i(uint256): 1 -> 1
// gas Legacy: 24481
// gas LegacyOptimized: 23322
// gas Yul: 25256
// gas YulOptimized: 23452
// i(uint256): 2 -> 4
// gas Legacy: 24481
// gas LegacyOptimized: 23322
// gas Yul: 25256
// gas YulOptimized: 23452
// i(uint256): 4 -> 16
// gas Legacy: 24481
// gas LegacyOptimized: 23322
// gas Yul: 25256
// gas YulOptimized: 23452
// j(uint256): 1 -> 1
// gas Legacy: 24591
// gas LegacyOptimized: 23432
// gas Yul: 25372
// gas YulOptimized: 23619
// j(uint256): 2 -> 4
// gas Legacy: 24591
// gas LegacyOptimized: 23432
// gas Yul: 25372
// gas YulOptimized: 23619
// j(uint256): 4 -> 16
// gas Legacy: 24591
// gas LegacyOptimized: 23432
// gas Yul: 25372
// gas YulOptimized: 23619
// k(uint256): 1 -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 23345
// gas LegacyOptimized: 22866
// gas Yul: 23244
// gas YulOptimized: 22611
// k(uint256): 2 -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 23345
// gas LegacyOptimized: 22866
// gas Yul: 23244
// gas YulOptimized: 22611
// k(uint256): 4 -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 23345
// gas LegacyOptimized: 22866
// gas Yul: 23244
// gas YulOptimized: 22611
