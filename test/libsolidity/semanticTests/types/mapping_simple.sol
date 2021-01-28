contract test {
    mapping(uint8 => uint8) table;
    function get(uint8 k) public returns (uint8 v) {
        return table[k];
    }
    function set(uint8 k, uint8 v) public {
        table[k] = v;
    }
}
// ====
// compileViaYul: also
// ----
// get(uint8): 0 -> 0
// gas Legacy: 22732
// gas LegacyOptimized: 22468
// gas Yul: 23300
// gas YulOptimized: 22611
// get(uint8): 0x01 -> 0
// gas Legacy: 22744
// gas LegacyOptimized: 22480
// gas Yul: 23312
// gas YulOptimized: 22623
// get(uint8): 0xa7 -> 0
// gas Legacy: 22744
// gas LegacyOptimized: 22480
// gas Yul: 23312
// gas YulOptimized: 22623
// set(uint8,uint8): 0x01, 0xa1 ->
// gas Legacy: 42870
// gas LegacyOptimized: 42616
// gas Yul: 43574
// gas YulOptimized: 42711
// get(uint8): 0 -> 0
// gas Legacy: 22732
// gas LegacyOptimized: 22468
// gas Yul: 23300
// gas YulOptimized: 22611
// get(uint8): 0x01 -> 0xa1
// gas Legacy: 22744
// gas LegacyOptimized: 22480
// gas Yul: 23312
// gas YulOptimized: 22623
// get(uint8): 0xa7 -> 0
// gas Legacy: 22744
// gas LegacyOptimized: 22480
// gas Yul: 23312
// gas YulOptimized: 22623
// set(uint8,uint8): 0x00, 0xef ->
// gas Legacy: 42858
// gas LegacyOptimized: 42604
// gas Yul: 43562
// gas YulOptimized: 42699
// get(uint8): 0 -> 0xef
// gas Legacy: 22732
// gas LegacyOptimized: 22468
// gas Yul: 23300
// gas YulOptimized: 22611
// get(uint8): 0x01 -> 0xa1
// gas Legacy: 22744
// gas LegacyOptimized: 22480
// gas Yul: 23312
// gas YulOptimized: 22623
// get(uint8): 0xa7 -> 0
// gas Legacy: 22744
// gas LegacyOptimized: 22480
// gas Yul: 23312
// gas YulOptimized: 22623
// set(uint8,uint8): 0x01, 0x05 ->
// gas Legacy: 23670
// gas LegacyOptimized: 23416
// gas Yul: 24374
// gas YulOptimized: 23511
// get(uint8): 0 -> 0xef
// gas Legacy: 22732
// gas LegacyOptimized: 22468
// gas Yul: 23300
// gas YulOptimized: 22611
// get(uint8): 0x01 -> 0x05
// gas Legacy: 22744
// gas LegacyOptimized: 22480
// gas Yul: 23312
// gas YulOptimized: 22623
// get(uint8): 0xa7 -> 0
// gas Legacy: 22744
// gas LegacyOptimized: 22480
// gas Yul: 23312
// gas YulOptimized: 22623
