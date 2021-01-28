contract C {
    function f() public pure returns (string memory) {
        return "";
    }
    function g(string calldata msg) public pure returns (string memory) {
        return msg;
    }
    function h(string calldata msg, uint256 v) public pure returns (string memory, uint256) {
        return (msg, v);
    }
    // Adjusting order of input/output intentionally.
    function i(string calldata msg1, uint256 v, string calldata msg2) public pure returns (string memory, string memory, uint256) {
        return (msg1, msg2, v);
    }
    function j(string calldata msg1, uint256 v) public pure returns (string memory, string memory, uint256) {
        return (msg1, "", v);
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x20, 0
// gas Legacy: 21691
// gas LegacyOptimized: 21470
// gas Yul: 22547
// gas YulOptimized: 21864
// g(string): 0x20, 0, "" -> 0x20, 0
// gas Legacy: 22649
// gas LegacyOptimized: 22368
// gas Yul: 23382
// gas YulOptimized: 22687
// g(string): 0x20, 0 -> 0x20, 0
// gas Legacy: 22521
// gas LegacyOptimized: 22240
// gas Yul: 23254
// gas YulOptimized: 22559
// h(string,uint256): 0x40, 0x888, 0, "" -> 0x40, 0x0888, 0
// gas Legacy: 23060
// gas LegacyOptimized: 22555
// gas Yul: 23827
// gas YulOptimized: 22911
// h(string,uint256): 0x40, 0x888, 0 -> 0x40, 0x0888, 0
// gas Legacy: 22932
// gas LegacyOptimized: 22427
// gas Yul: 23699
// gas YulOptimized: 22783
// i(string,uint256,string): 0x60, 0x888, 0x60, 0, "" -> 0x60, 0x80, 0x0888, 0, 0
// gas Legacy: 24058
// gas LegacyOptimized: 23347
// gas Yul: 25247
// gas YulOptimized: 23905
// i(string,uint256,string): 0x60, 0x888, 0x60, 0 -> 0x60, 0x80, 0x0888, 0, 0
// gas Legacy: 23930
// gas LegacyOptimized: 23219
// gas Yul: 25119
// gas YulOptimized: 23777
// j(string,uint256): 0x40, 0x888, 0, "" -> 0x60, 0x80, 0x0888, 0, 0
// gas Legacy: 23467
// gas LegacyOptimized: 22763
// gas Yul: 24715
// gas YulOptimized: 23322
// j(string,uint256): 0x40, 0x888, 0 -> 0x60, 0x80, 0x0888, 0, 0
// gas Legacy: 23339
// gas LegacyOptimized: 22635
// gas Yul: 24587
// gas YulOptimized: 23194
