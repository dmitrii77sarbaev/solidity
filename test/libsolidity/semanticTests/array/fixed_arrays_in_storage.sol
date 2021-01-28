contract c {
    struct Data {
        uint256 x;
        uint256 y;
    }
    Data[2**10] data;
    uint256[2**10 + 3] ids;

    function setIDStatic(uint256 id) public {
        ids[2] = id;
    }

    function setID(uint256 index, uint256 id) public {
        ids[index] = id;
    }

    function setData(uint256 index, uint256 x, uint256 y) public {
        data[index].x = x;
        data[index].y = y;
    }

    function getID(uint256 index) public returns (uint256) {
        return ids[index];
    }

    function getData(uint256 index) public returns (uint256 x, uint256 y) {
        x = data[index].x;
        y = data[index].y;
    }

    function getLengths() public returns (uint256 l1, uint256 l2) {
        l1 = data.length;
        l2 = ids.length;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// setIDStatic(uint256): 0xb ->
// gas Legacy: 41719
// gas LegacyOptimized: 41494
// gas Yul: 43412
// gas YulOptimized: 41642
// getID(uint256): 0x2 -> 0xb
// gas Legacy: 22635
// gas LegacyOptimized: 22348
// gas Yul: 23317
// gas YulOptimized: 22501
// setID(uint256,uint256): 0x7, 0x8 ->
// gas Legacy: 42054
// gas LegacyOptimized: 41715
// gas Yul: 43757
// gas YulOptimized: 41874
// getID(uint256): 0x7 -> 0x8
// gas Legacy: 22635
// gas LegacyOptimized: 22348
// gas Yul: 23317
// gas YulOptimized: 22501
// setData(uint256,uint256,uint256): 0x7, 0x8, 0x9 ->
// gas Legacy: 62369
// gas LegacyOptimized: 61879
// gas Yul: 65260
// gas YulOptimized: 62019
// setData(uint256,uint256,uint256): 0x8, 0xa, 0xb ->
// gas Legacy: 62369
// gas LegacyOptimized: 61879
// gas Yul: 65260
// gas YulOptimized: 62019
// getData(uint256): 0x7 -> 0x8, 0x9
// gas Legacy: 23581
// gas LegacyOptimized: 23209
// gas Yul: 24593
// gas YulOptimized: 23510
// getData(uint256): 0x8 -> 0xa, 0xb
// gas Legacy: 23581
// gas LegacyOptimized: 23209
// gas Yul: 24593
// gas YulOptimized: 23510
// getLengths() -> 0x400, 0x403
// gas Legacy: 21559
// gas LegacyOptimized: 21360
// gas Yul: 22039
// gas YulOptimized: 21582
