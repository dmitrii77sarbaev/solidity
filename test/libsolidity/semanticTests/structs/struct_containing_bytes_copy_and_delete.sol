contract c {
    struct Struct { uint a; bytes data; uint b; }
    Struct data1;
    Struct data2;
    function set(uint _a, bytes calldata _data, uint _b) external returns (bool) {
        data1.a = _a;
        data1.b = _b;
        data1.data = _data;
        return true;
    }
    function copy() public returns (bool) {
        data1 = data2;
        return true;
    }
    function del() public returns (bool) {
        delete data1;
        return true;
    }
    function test(uint256 i) public returns (bytes1) {
        return data1.data[i];
    }
}
// ====
// compileViaYul: also
// ----
// storage: empty// set(uint256,bytes,uint256): 12, 0x60, 13, 33, "12345678901234567890123456789012", "3" -> true
// gas Legacy: 124736
// gas LegacyOptimized: 124199
// gas Yul: 127524
// gas YulOptimized: 124422
// test(uint256): 32 -> "3"
// gas Legacy: 24464
// gas LegacyOptimized: 24196
// gas Yul: 24399
// gas YulOptimized: 23552
// storage: nonempty// copy() -> true
// gas Legacy: 29287
// gas LegacyOptimized: 29132
// gas Yul: 35462
// gas YulOptimized: 29633
// storage: empty// set(uint256,bytes,uint256): 12, 0x60, 13, 33, "12345678901234567890123456789012", "3" -> true
// gas Legacy: 28736
// gas LegacyOptimized: 28199
// gas Yul: 31524
// gas YulOptimized: 28422
// storage: nonempty// del() -> true
// gas Legacy: 26740
// gas LegacyOptimized: 26591
// gas Yul: 32410
// gas YulOptimized: 29519
// storage: empty