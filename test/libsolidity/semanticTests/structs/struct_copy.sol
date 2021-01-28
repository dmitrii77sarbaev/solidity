contract c {
    struct Nested {
        uint256 x;
        uint256 y;
    }
    struct Struct {
        uint256 a;
        Nested nested;
        uint256 c;
    }
    mapping(uint256 => Struct) data;

    function set(uint256 k) public returns (bool) {
        data[k].a = 1;
        data[k].nested.x = 3;
        data[k].nested.y = 4;
        data[k].c = 2;
        return true;
    }

    function copy(uint256 from, uint256 to) public returns (bool) {
        data[to] = data[from];
        return true;
    }

    function retrieve(uint256 k)
        public
        returns (uint256 a, uint256 x, uint256 y, uint256 c)
    {
        a = data[k].a;
        x = data[k].nested.x;
        y = data[k].nested.y;
        c = data[k].c;
    }
}

// ====
// compileViaYul: also
// ----
// set(uint256): 7 -> true
// gas Legacy: 102216
// gas LegacyOptimized: 101650
// gas Yul: 107768
// gas YulOptimized: 101963
// retrieve(uint256): 7 -> 1, 3, 4, 2
// gas Legacy: 25715
// gas LegacyOptimized: 24911
// gas Yul: 27261
// gas YulOptimized: 25263
// copy(uint256,uint256): 7, 8 -> true
// gas Legacy: 105566
// gas LegacyOptimized: 105066
// gas Yul: 111511
// gas YulOptimized: 105289
// retrieve(uint256): 7 -> 1, 3, 4, 2
// gas Legacy: 25715
// gas LegacyOptimized: 24911
// gas Yul: 27261
// gas YulOptimized: 25263
// retrieve(uint256): 8 -> 1, 3, 4, 2
// gas Legacy: 25715
// gas LegacyOptimized: 24911
// gas Yul: 27261
// gas YulOptimized: 25263
// copy(uint256,uint256): 0, 7 -> true
// gas Legacy: 28754
// gas LegacyOptimized: 28254
// gas Yul: 34699
// gas YulOptimized: 28477
// retrieve(uint256): 7 -> 0, 0, 0, 0
// gas Legacy: 25715
// gas LegacyOptimized: 24911
// gas Yul: 27261
// gas YulOptimized: 25263
// retrieve(uint256): 8 -> 1, 3, 4, 2
// gas Legacy: 25715
// gas LegacyOptimized: 24911
// gas Yul: 27261
// gas YulOptimized: 25263
// copy(uint256,uint256): 7, 8 -> true
// gas Legacy: 28766
// gas LegacyOptimized: 28266
// gas Yul: 34711
// gas YulOptimized: 28489
// retrieve(uint256): 8 -> 0, 0, 0, 0
// gas Legacy: 25715
// gas LegacyOptimized: 24911
// gas Yul: 27261
// gas YulOptimized: 25263
