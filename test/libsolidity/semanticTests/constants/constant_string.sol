contract C {
    bytes constant a = "\x03\x01\x02";
    bytes constant b = hex"030102";
    string constant c = "hello";

    function f() public returns (bytes memory) {
        return a;
    }

    function g() public returns (bytes memory) {
        return b;
    }

    function h() public returns (bytes memory) {
        return bytes(c);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x20, 3, "\x03\x01\x02"
// gas Legacy: 21805
// gas LegacyOptimized: 21560
// gas Yul: 22740
// gas YulOptimized: 21948
// g() -> 0x20, 3, "\x03\x01\x02"
// gas Legacy: 21849
// gas LegacyOptimized: 21604
// gas Yul: 22784
// gas YulOptimized: 21992
// h() -> 0x20, 5, "hello"
// gas Legacy: 21827
// gas LegacyOptimized: 21582
// gas Yul: 22800
// gas YulOptimized: 21964
