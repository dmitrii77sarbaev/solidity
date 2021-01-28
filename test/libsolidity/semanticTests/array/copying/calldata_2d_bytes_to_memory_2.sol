pragma abicoder v2;

contract C {
    function g(bytes[2] memory m) internal {
        assert(m[0].length > 1);
        assert(m[1].length > 1);
        assert(m[0][0] == m[1][0]);
        assert(m[0][1] == m[1][1]);
    }
    function f(bytes[2] calldata c) external {
        g(c);
    }
}
// ====
// compileViaYul: also
// ----
// f(bytes[2]): 0x20, 0x40, 0x40, 2, "ab" ->
// gas Legacy: 24702
// gas LegacyOptimized: 23482
// gas Yul: 28065
// gas YulOptimized: 24206
// f(bytes[2]): 0x20, 0x40, 0x40, 1, "a" -> FAILURE, hex"4e487b71", 0x01
// gas Legacy: 24171
// gas LegacyOptimized: 23096
// gas Yul: 24613
// gas YulOptimized: 23121
