contract C {
    function a(uint256 x) public returns (uint256) {
        return x + 1;
    }

    function b(uint256 x) public returns (uint256) {
        return x + 2;
    }

    function c(uint256 x) public returns (uint256) {
        return x + 3;
    }

    function d(uint256 x) public returns (uint256) {
        return x + 5;
    }

    function e(uint256 x) public returns (uint256) {
        return x + 8;
    }

    function test(uint256 x, uint256 i) public returns (uint256) {
        function(uint) internal returns (uint)[] memory arr =
            new function(uint) internal returns (uint)[](10);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr[i](x);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test(uint256,uint256): 10, 0 -> 11
// gas Legacy: 23483
// gas LegacyOptimized: 22870
// gas Yul: 26616
// gas YulOptimized: 23604
// test(uint256,uint256): 10, 1 -> 12
// gas Legacy: 23495
// gas LegacyOptimized: 22882
// gas Yul: 26650
// gas YulOptimized: 23638
// test(uint256,uint256): 10, 2 -> 13
// gas Legacy: 23495
// gas LegacyOptimized: 22882
// gas Yul: 26672
// gas YulOptimized: 23660
// test(uint256,uint256): 10, 3 -> 15
// gas Legacy: 23495
// gas LegacyOptimized: 22882
// gas Yul: 26694
// gas YulOptimized: 23682
// test(uint256,uint256): 10, 4 -> 18
// gas Legacy: 23495
// gas LegacyOptimized: 22882
// gas Yul: 26705
// gas YulOptimized: 23693
// test(uint256,uint256): 10, 5 -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 23095
// gas LegacyOptimized: 22722
// gas Yul: 25919
// gas YulOptimized: 23386
