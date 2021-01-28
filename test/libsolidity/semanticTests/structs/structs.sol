contract test {
    struct s1 {
        uint8 x;
        bool y;
    }
    struct s2 {
        uint32 z;
        s1 s1data;
        mapping(uint8 => s2) recursive;
    }
    s2 data;
    function check() public returns (bool ok) {
        return data.z == 1 && data.s1data.x == 2 &&
            data.s1data.y == true &&
            data.recursive[3].recursive[4].z == 5 &&
            data.recursive[4].recursive[3].z == 6 &&
            data.recursive[0].s1data.y == false &&
            data.recursive[4].z == 9;
    }
    function set() public {
        data.z = 1;
        data.s1data.x = 2;
        data.s1data.y = true;
        data.recursive[3].recursive[4].z = 5;
        data.recursive[4].recursive[3].z = 6;
        data.recursive[0].s1data.y = false;
        data.recursive[4].z = 9;
    }
}
// ====
// compileViaYul: also
// ----
// check() -> false
// gas Legacy: 22359
// gas LegacyOptimized: 22216
// gas Yul: 23066
// gas YulOptimized: 22433
// set() ->
// gas Legacy: 129577
// gas LegacyOptimized: 127009
// gas Yul: 132857
// gas YulOptimized: 128680
// check() -> true
// gas Legacy: 28183
// gas LegacyOptimized: 27215
// gas Yul: 31210
// gas YulOptimized: 28382
