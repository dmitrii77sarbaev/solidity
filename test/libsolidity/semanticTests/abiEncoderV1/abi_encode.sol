contract C {
    function f0() public returns (bytes memory) {
        return abi.encode();
    }

    function f1() public returns (bytes memory) {
        return abi.encode(1, 2);
    }

    function f2() public returns (bytes memory) {
        string memory x = "abc";
        return abi.encode(1, x, 2);
    }

    function f3() public returns (bytes memory r) {
        // test that memory is properly allocated
        string memory x = "abc";
        r = abi.encode(1, x, 2);
        bytes memory y = "def";
        require(y[0] == "d");
        y[0] = "e";
        require(y[0] == "e");
    }

    function f4() public returns (bytes memory) {
        bytes4 x = "abcd";
        return abi.encode(bytes2(x));
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f0() -> 0x20, 0x0
// gas Legacy: 21726
// gas LegacyOptimized: 21492
// gas Yul: 22350
// gas YulOptimized: 21818
// f1() -> 0x20, 0x40, 0x1, 0x2
// gas Legacy: 22282
// gas LegacyOptimized: 21810
// gas Yul: 22856
// gas YulOptimized: 22090
// f2() -> 0x20, 0xa0, 0x1, 0x60, 0x2, 0x3, "abc"
// gas Legacy: 22989
// gas LegacyOptimized: 22360
// gas Yul: 24068
// gas YulOptimized: 22979
// f3() -> 0x20, 0xa0, 0x1, 0x60, 0x2, 0x3, "abc"
// gas Legacy: 23345
// gas LegacyOptimized: 22583
// gas Yul: 26002
// gas YulOptimized: 23657
// f4() -> 0x20, 0x20, "ab"
// gas Legacy: 22044
// gas LegacyOptimized: 21758
// gas Yul: 22756
// gas YulOptimized: 22004
