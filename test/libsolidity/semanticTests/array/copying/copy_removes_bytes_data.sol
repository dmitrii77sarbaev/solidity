
contract c {
    function set() public returns (bool) { data1 = msg.data; return true; }
    function reset() public returns (bool) { data1 = data2; return true; }
    bytes data1;
    bytes data2;
}
// ====
// compileViaYul: also
// ----
// set(): 1, 2, 3, 4, 5 -> true
// gas Legacy: 163756
// gas LegacyOptimized: 163628
// gas Yul: 164497
// gas YulOptimized: 163861
// storage: nonempty// reset() -> true
// gas Legacy: 29432
// gas LegacyOptimized: 29264
// gas Yul: 37999
// gas YulOptimized: 29831
// storage: empty