contract C {

    function len() public returns (uint ret) {
        uint[] memory data = new uint[](2);
        data[0] = 234;
        data[1] = 123;
        delete data;
        assembly {
            ret := mload(data)
        }
    }
}

// ====
// compileViaYul: also
// ----
// len() -> 0
// gas Legacy: 21695
// gas LegacyOptimized: 21516
// gas Yul: 23359
// gas YulOptimized: 21973
