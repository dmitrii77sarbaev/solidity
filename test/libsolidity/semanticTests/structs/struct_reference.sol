contract test {
    struct s2 {
        uint32 z;
        mapping(uint8 => s2) recursive;
    }
    s2 data;
    function check() public returns (bool ok) {
        return data.z == 2 &&
            data.recursive[0].z == 3 &&
            data.recursive[0].recursive[1].z == 0 &&
            data.recursive[0].recursive[0].z == 1;
    }
    function set() public {
        data.z = 2;
        mapping(uint8 => s2) storage map = data.recursive;
        s2 storage inner = map[0];
        inner.z = 3;
        inner.recursive[0].z = inner.recursive[1].z + 1;
    }
}
// ====
// compileViaYul: also
// ----
// check() -> false
// gas Legacy: 22299
// gas LegacyOptimized: 22156
// gas Yul: 22991
// gas YulOptimized: 22307
// set() ->
// gas Legacy: 85171
// gas LegacyOptimized: 84723
// gas Yul: 87167
// gas YulOptimized: 84942
// check() -> true
// gas Legacy: 25326
// gas LegacyOptimized: 24658
// gas Yul: 27522
// gas YulOptimized: 25411
