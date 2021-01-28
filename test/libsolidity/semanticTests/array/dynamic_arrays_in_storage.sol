contract c {
    struct Data {
        uint256 x;
        uint256 y;
    }
    Data[] data;
    uint256[] ids;

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

    function setLengths(uint256 l1, uint256 l2) public {
        while (data.length < l1) data.push();
        while (ids.length < l2) ids.push();
    }
}

// ====
// compileViaYul: also
// ----
// getLengths() -> 0, 0
// gas Legacy: 23153
// gas LegacyOptimized: 22938
// gas Yul: 23661
// gas YulOptimized: 23204
// setLengths(uint256,uint256): 48, 49 ->
// gas Legacy: 308271
// gas LegacyOptimized: 300117
// gas Yul: 431473
// gas YulOptimized: 276446
// getLengths() -> 48, 49
// gas Legacy: 23153
// gas LegacyOptimized: 22938
// gas Yul: 23661
// gas YulOptimized: 23204
// setIDStatic(uint256): 11 ->
// gas Legacy: 42548
// gas LegacyOptimized: 42363
// gas Yul: 44290
// gas YulOptimized: 42547
// getID(uint256): 2 -> 11
// gas Legacy: 23509
// gas LegacyOptimized: 23225
// gas Yul: 24173
// gas YulOptimized: 23349
// setID(uint256,uint256): 7, 8 ->
// gas Legacy: 42883
// gas LegacyOptimized: 42550
// gas Yul: 44635
// gas YulOptimized: 42744
// getID(uint256): 7 -> 8
// gas Legacy: 23509
// gas LegacyOptimized: 23225
// gas Yul: 24173
// gas YulOptimized: 23349
// setData(uint256,uint256,uint256): 7, 8, 9 ->
// gas Legacy: 64055
// gas LegacyOptimized: 63579
// gas Yul: 66994
// gas YulOptimized: 63906
// setData(uint256,uint256,uint256): 8, 10, 11 ->
// gas Legacy: 64055
// gas LegacyOptimized: 63579
// gas Yul: 66994
// gas YulOptimized: 63906
// getData(uint256): 7 -> 8, 9
// gas Legacy: 25312
// gas LegacyOptimized: 24946
// gas Yul: 26305
// gas YulOptimized: 25216
// getData(uint256): 8 -> 10, 11
// gas Legacy: 25312
// gas LegacyOptimized: 24946
// gas Yul: 26305
// gas YulOptimized: 25216
