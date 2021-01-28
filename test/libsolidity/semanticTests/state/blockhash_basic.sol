contract C {
    bytes32 public genesisHash;
    bytes32 public currentHash;
    constructor() {
        require(block.number == 1);
        genesisHash = blockhash(0);
        currentHash = blockhash(1);
    }
    function f(uint blockNumber) public returns (bytes32) {
        return blockhash(blockNumber);
    }
}
// ====
// compileViaYul: also
// ----
// constructor()
// gas Legacy: 170193
// gas LegacyOptimized: 129787
// gas Yul: 238520
// gas YulOptimized: 153493
// genesisHash() -> 0x3737373737373737373737373737373737373737373737373737373737373737
// gas Legacy: 22193
// gas LegacyOptimized: 22092
// gas Yul: 22744
// gas YulOptimized: 22262
// currentHash() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22240
// f(uint256): 0 -> 0x3737373737373737373737373737373737373737373737373737373737373737
// gas Legacy: 21836
// gas LegacyOptimized: 21536
// gas Yul: 22136
// gas YulOptimized: 21649
// f(uint256): 1 -> 0x3737373737373737373737373737373737373737373737373737373737373738
// gas Legacy: 21848
// gas LegacyOptimized: 21548
// gas Yul: 22148
// gas YulOptimized: 21661
// f(uint256): 255 -> 0x00
// gas Legacy: 21848
// gas LegacyOptimized: 21548
// gas Yul: 22148
// gas YulOptimized: 21661
// f(uint256): 256 -> 0x00
// gas Legacy: 21848
// gas LegacyOptimized: 21548
// gas Yul: 22148
// gas YulOptimized: 21661
// f(uint256): 257 -> 0x00
// gas Legacy: 21860
// gas LegacyOptimized: 21560
// gas Yul: 22160
// gas YulOptimized: 21673
