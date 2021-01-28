==== Source: s1.sol ====


bytes constant a = b;
bytes constant b = hex"030102";

function fre() pure returns (bytes memory) {
    return a;
}

==== Source: s2.sol ====

import "s1.sol";

uint256 constant c = uint8(a[0]) + 2;

contract C {
    function f() public returns (bytes memory) {
        return a;
    }

    function g() public returns (bytes memory) {
        return b;
    }

    function h() public returns (uint) {
        return c;
    }

    function i() public returns (bytes memory) {
        return fre();
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x20, 3, "\x03\x01\x02"
// gas Legacy: 21805
// gas LegacyOptimized: 21560
// gas Yul: 22776
// gas YulOptimized: 21862
// g() -> 0x20, 3, "\x03\x01\x02"
// gas Legacy: 21849
// gas LegacyOptimized: 21604
// gas Yul: 22784
// gas YulOptimized: 21906
// h() -> 5
// gas Legacy: 21725
// gas LegacyOptimized: 21482
// gas Yul: 23395
// gas YulOptimized: 21787
// i() -> 0x20, 3, "\x03\x01\x02"
// gas Legacy: 21906
// gas LegacyOptimized: 21661
// gas Yul: 22922
// gas YulOptimized: 21928
