contract C {
    address[] addressArray;
    function set_get_length(uint256 len) public returns (uint256)
    {
        while(addressArray.length < len)
            addressArray.push();
        while(addressArray.length > len)
            addressArray.pop();
        return addressArray.length;
    }
}
// ====
// EVMVersion: >=petersburg
// compileViaYul: also
// ----
// set_get_length(uint256): 0 -> 0
// gas Legacy: 24250
// gas LegacyOptimized: 23935
// gas Yul: 24909
// gas YulOptimized: 24076
// set_get_length(uint256): 1 -> 1
// gas Legacy: 46827
// gas LegacyOptimized: 45605
// gas Yul: 47923
// gas YulOptimized: 45948
// set_get_length(uint256): 10 -> 10
// gas Legacy: 54547
// gas LegacyOptimized: 46069
// gas Yul: 59139
// gas YulOptimized: 48028
// set_get_length(uint256): 20 -> 20
// gas Legacy: 57912
// gas LegacyOptimized: 48527
// gas Yul: 62941
// gas YulOptimized: 50688
// set_get_length(uint256): 0 -> 0
// gas Legacy: 107830
// gas LegacyOptimized: 107295
// gas Yul: 144209
// gas YulOptimized: 110296
// set_get_length(uint256): 0xFF -> 0xFF
// gas Legacy: 882337
// gas LegacyOptimized: 650737
// gas Yul: 994431
// gas YulOptimized: 702388
// set_get_length(uint256): 0xFFF -> 0xFFF
// gas Legacy: 12945874
// gas LegacyOptimized: 9462679
// gas Yul: 14624613
// gas YulOptimized: 10238500
// set_get_length(uint256): 0xFFFF -> FAILURE # Out-of-gas #
// gas Legacy: 100000000
// gas LegacyOptimized: 100000000
// gas Yul: 100000000
// gas YulOptimized: 100000000
