pragma abicoder               v2;


contract C {
    function f(uint256[][1][] calldata a) external returns (uint256) {
        return 42;
    }

    function g(uint256[][1][] calldata a) external returns (uint256) {
        a[0];
        return 42;
    }

    function h(uint256[][1][] calldata a) external returns (uint256) {
        a[0][0];
        return 42;
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256[][1][]): 0x20, 0x0 -> 42 # valid access stub #
// gas Legacy: 22002
// gas LegacyOptimized: 21830
// gas Yul: 22399
// gas YulOptimized: 21936
// f(uint256[][1][]): 0x20, 0x1 -> FAILURE # invalid on argument decoding #
// gas Legacy: 21742
// gas LegacyOptimized: 21686
// gas Yul: 21769
// gas YulOptimized: 21693
// f(uint256[][1][]): 0x20, 0x1, 0x20 -> 42 # invalid on outer access #
// gas Legacy: 22154
// gas LegacyOptimized: 21982
// gas Yul: 22551
// gas YulOptimized: 22088
// g(uint256[][1][]): 0x20, 0x1, 0x20 -> FAILURE
// gas Legacy: 22055
// gas LegacyOptimized: 21989
// gas Yul: 22255
// gas YulOptimized: 22005
// f(uint256[][1][]): 0x20, 0x1, 0x20, 0x20 -> 42 # invalid on inner access #
// gas Legacy: 22294
// gas LegacyOptimized: 22122
// gas Yul: 22691
// gas YulOptimized: 22228
// g(uint256[][1][]): 0x20, 0x1, 0x20, 0x20 -> 42
// gas Legacy: 22433
// gas LegacyOptimized: 22259
// gas Yul: 22976
// gas YulOptimized: 22420
// h(uint256[][1][]): 0x20, 0x1, 0x20, 0x20 -> FAILURE
// gas Legacy: 22390
// gas LegacyOptimized: 22274
// gas Yul: 22747
// gas YulOptimized: 22276
// f(uint256[][1][]): 0x20, 0x1, 0x20, 0x20, 0x1 -> 42
// gas Legacy: 22434
// gas LegacyOptimized: 22262
// gas Yul: 22831
// gas YulOptimized: 22368
// g(uint256[][1][]): 0x20, 0x1, 0x20, 0x20, 0x1 -> 42
// gas Legacy: 22573
// gas LegacyOptimized: 22399
// gas Yul: 23116
// gas YulOptimized: 22560
// h(uint256[][1][]): 0x20, 0x1, 0x20, 0x20, 0x1 -> FAILURE
// gas Legacy: 22634
// gas LegacyOptimized: 22510
// gas Yul: 22991
// gas YulOptimized: 22509
