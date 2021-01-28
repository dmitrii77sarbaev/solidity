contract BinarySearch {
    /// Finds the position of _value in the sorted list _data.
    /// Note that "internal" is important here, because storage references only work for internal or private functions
    function find(uint256[] storage _data, uint256 _value)
        internal
        returns (uint256 o_position)
    {
        return find(_data, 0, _data.length, _value);
    }

    function find(
        uint256[] storage _data,
        uint256 _begin,
        uint256 _len,
        uint256 _value
    ) private returns (uint256 o_position) {
        if (_len == 0 || (_len == 1 && _data[_begin] != _value))
            return type(uint256).max; // failure
        uint256 halfLen = _len / 2;
        uint256 v = _data[_begin + halfLen];
        if (_value < v) return find(_data, _begin, halfLen, _value);
        else if (_value > v)
            return find(_data, _begin + halfLen + 1, halfLen - 1, _value);
        else return _begin + halfLen;
    }
}


contract Store is BinarySearch {
    uint256[] data;

    function add(uint256 v) public {
        data.push(0);
        data[data.length - 1] = v;
    }

    function find(uint256 v) public returns (uint256) {
        return find(data, v);
    }
}

// ====
// compileViaYul: also
// ----
// find(uint256): 7 -> -1
// gas Legacy: 22774
// gas LegacyOptimized: 22481
// gas Yul: 23477
// gas YulOptimized: 22586
// add(uint256): 7 ->
// gas Legacy: 65198
// gas LegacyOptimized: 64812
// gas Yul: 69333
// gas YulOptimized: 66866
// find(uint256): 7 -> 0
// gas Legacy: 26816
// gas LegacyOptimized: 26155
// gas Yul: 28804
// gas YulOptimized: 26601
// add(uint256): 11 ->
// gas Legacy: 45998
// gas LegacyOptimized: 45612
// gas Yul: 50133
// gas YulOptimized: 47666
// add(uint256): 17 ->
// gas Legacy: 45998
// gas LegacyOptimized: 45612
// gas Yul: 50133
// gas YulOptimized: 47666
// add(uint256): 27 ->
// gas Legacy: 45998
// gas LegacyOptimized: 45612
// gas Yul: 50133
// gas YulOptimized: 47666
// add(uint256): 31 ->
// gas Legacy: 45998
// gas LegacyOptimized: 45612
// gas Yul: 50133
// gas YulOptimized: 47666
// add(uint256): 32 ->
// gas Legacy: 45998
// gas LegacyOptimized: 45612
// gas Yul: 50133
// gas YulOptimized: 47666
// add(uint256): 66 ->
// gas Legacy: 45998
// gas LegacyOptimized: 45612
// gas Yul: 50133
// gas YulOptimized: 47666
// add(uint256): 177 ->
// gas Legacy: 45998
// gas LegacyOptimized: 45612
// gas Yul: 50133
// gas YulOptimized: 47666
// find(uint256): 7 -> 0
// gas Legacy: 33566
// gas LegacyOptimized: 32140
// gas Yul: 38209
// gas YulOptimized: 33159
// find(uint256): 27 -> 3
// gas Legacy: 31918
// gas LegacyOptimized: 30372
// gas Yul: 35955
// gas YulOptimized: 31261
// find(uint256): 32 -> 5
// gas Legacy: 31918
// gas LegacyOptimized: 30372
// gas Yul: 35955
// gas YulOptimized: 31261
// find(uint256): 176 -> -1
// gas Legacy: 28478
// gas LegacyOptimized: 26925
// gas Yul: 31509
// gas YulOptimized: 27534
// find(uint256): 0 -> -1
// gas Legacy: 31237
// gas LegacyOptimized: 30178
// gas Yul: 35218
// gas YulOptimized: 31004
// find(uint256): 400 -> -1
// gas Legacy: 28490
// gas LegacyOptimized: 26937
// gas Yul: 31521
// gas YulOptimized: 27546
