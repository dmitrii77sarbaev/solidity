contract c {
    function set(uint key) public returns (bool) { data[key] = msg.data; return true; }
    function copy(uint from, uint to) public returns (bool) { data[to] = data[from]; return true; }
    mapping(uint => bytes) data;
}
// ====
// compileViaYul: also
// ----
// set(uint256): 1, 2 -> true
// gas Legacy: 103491
// gas LegacyOptimized: 103168
// gas Yul: 104197
// gas YulOptimized: 103365
// set(uint256): 2, 2, 3, 4, 5 -> true
// gas Legacy: 164121
// gas LegacyOptimized: 163798
// gas Yul: 164902
// gas YulOptimized: 164052
// storage: nonempty// copy(uint256,uint256): 1, 2 -> true
// gas Legacy: 32845
// gas LegacyOptimized: 32339
// gas Yul: 37732
// gas YulOptimized: 32767
// storage: nonempty// copy(uint256,uint256): 99, 1 -> true
// gas Legacy: 27713
// gas LegacyOptimized: 27208
// gas Yul: 32654
// gas YulOptimized: 27633
// storage: nonempty// copy(uint256,uint256): 99, 2 -> true
// gas Legacy: 27713
// gas LegacyOptimized: 27208
// gas Yul: 32654
// gas YulOptimized: 27633
// storage: empty