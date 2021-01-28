contract c {
    bytes data;
    function test_short() public returns (uint256 r) {
        assembly {
            sstore(data.slot, 0)
        }
        for (uint8 i = 0; i < 15; i++) {
            data.push(bytes1(i));
        }
        assembly {
            r := sload(data.slot)
        }
    }

    function test_long() public returns (uint256 r) {
        assembly {
            sstore(data.slot, 0)
        }
        for (uint8 i = 0; i < 33; i++) {
            data.push(bytes1(i));
        }
        assembly {
            r := sload(data.slot)
        }
    }

    function test_pop() public returns (uint256 r) {
        assembly {
            sstore(data.slot, 0)
        }
        for (uint8 i = 0; i < 32; i++) {
            data.push(bytes1(i));
        }
        data.pop();
        data.pop();
        assembly {
            r := sload(data.slot)
        }
    }
}
// ====
// compileViaYul: also
// ----
// storage: empty// test_short() -> 1780731860627700044960722568376587075150542249149356309979516913770823710
// gas Legacy: 110938
// gas LegacyOptimized: 109724
// gas Yul: 81270
// gas YulOptimized: 74000
// storage: nonempty// test_long() -> 67
// gas Legacy: 213590
// gas LegacyOptimized: 211044
// gas Yul: 150411
// gas YulOptimized: 134832
// storage: nonempty// test_pop() -> 1780731860627700044960722568376592200742329637303199754547598369979433020
// gas Legacy: 176030
// gas LegacyOptimized: 173503
// gas Yul: 112230
// gas YulOptimized: 97025
// storage: nonempty